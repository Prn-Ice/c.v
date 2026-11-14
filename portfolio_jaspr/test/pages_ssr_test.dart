import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart' as html;
import 'package:html/parser.dart';
import 'package:jaspr/server.dart';
import 'package:portfolio_jaspr/config.dart';
import 'package:portfolio_jaspr/icons/icon_mapper.dart';
import 'package:portfolio_jaspr/main.server.dart' as server;
import 'package:portfolio_jaspr/main.server.options.dart';
import 'package:portfolio_jaspr/seo.dart';
import 'package:shared/shared.dart';
import 'package:test/test.dart';

Future<html.Document> renderPage(String path) async {
  final response = await renderComponent(
    server.buildDocument(),
    request: Request('GET', Uri.parse('https://portfolio.prnice.me$path')),
  );
  expect(response.statusCode, 200);
  final page = parse(utf8.decode(response.body));
  expect(page.querySelectorAll('title'), hasLength(1));
  expect(page.querySelectorAll('meta[name="description"]'), hasLength(1));
  expect(page.querySelectorAll('link[rel="canonical"]'), hasLength(1));
  expect(
    page.querySelector('link[rel="canonical"]')!.attributes['href'],
    canonicalUrlFor(path),
  );
  expect(
    page.querySelector('meta[property="og:url"]')!.attributes['content'],
    canonicalUrlFor(path),
  );
  expect(
    page.querySelector('meta[property="og:title"]')!.attributes['content'],
    page.querySelector('title')!.text,
  );
  expect(page.querySelectorAll('meta[name^="og:"]'), isEmpty);
  expect(page.querySelectorAll('link[href*="fonts.googleapis.com"]'), isEmpty);
  expect(page.querySelectorAll('script[src]'), isEmpty);
  return page;
}

void main() {
  setUpAll(() => Jaspr.initializeApp(options: defaultServerOptions));

  test(
    'sitemap includes every public page and matches canonical URL policy',
    () {
      final sitemap = File('web/sitemap.xml').readAsStringSync();
      expect(
        RegExp(r'<loc>(.*?)</loc>')
            .allMatches(sitemap)
            .map((match) => match.group(1)),
        publicPagePaths.map(canonicalUrlFor),
      );
      expect(sitemap, isNot(contains('<lastmod>')));
    },
  );

  test('all icons have local SVG symbols and the font has its license', () {
    final sprite = parse(File('web/icons.svg').readAsStringSync());
    final symbols = sprite
        .querySelectorAll('symbol')
        .map((symbol) => symbol.id)
        .toSet();
    expect(symbols, containsAll(AppIcon.values.map(mapIconName)));
    expect(
      File('web/icons-LICENSE.txt').readAsStringSync(),
      contains('Apache License'),
    );
    expect(
      File('web/fonts/OFL.txt').readAsStringSync(),
      contains('SIL OPEN FONT LICENSE'),
    );
    final font = File('web/fonts/plus-jakarta-sans-latin-wght.woff2')
        .readAsBytesSync();
    expect(ascii.decode(font.take(4).toList()), 'wOF2');
  });

  for (final prefix in ['', '/jaspr']) {
    group('server-rendered pages with base path "$prefix"', () {
      setUp(() => basePath = prefix);
      tearDown(() => basePath = '');

      test('home contains current content and native project links', () async {
        final page = await renderPage('/');
        expect(page.querySelector('h1')!.text, 'Prince Nna');
        expect(page.querySelector('.hero-summary')!.text.trim(), heroSummary);
        expect(
          page
              .querySelectorAll('.card-link')
              .map((link) => link.attributes['href']),
          caseStudies.map((study) => '$prefix/case-study/${study.slug}/'),
        );
        expect(
          page.querySelector('#theme-toggle')!.attributes['aria-label'],
          'Switch to light theme',
        );
        expect(page.querySelector('title')!.text, jasprHomeTitle);
        expect(
          page.querySelector('a[href="$prefix$jasprDevelopmentPath/"]'),
          isNotNull,
        );
        expect(
          page
              .querySelector('link[rel="preload"][as="font"]')!
              .attributes['href'],
          '$prefix/fonts/plus-jakarta-sans-latin-wght.woff2',
        );
        for (final icon in page.querySelectorAll('.app-icon use')) {
          expect(icon.attributes['href'], startsWith('$prefix/icons.svg#'));
        }
        final person = jsonDecode(
          page.querySelector('script[type="application/ld+json"]')!.text,
        ) as Map<String, dynamic>;
        expect(person['knowsAbout'], contains('Jaspr'));
        for (final link in page.querySelectorAll('.footer-icons a')) {
          expect(link.attributes['aria-label'], isNotEmpty);
        }
      });

      test(
        'Jaspr development page shows specific work and a contact route',
        () async {
          final page = await renderPage(jasprDevelopmentPath);
          expect(page.querySelector('h1')!.text, 'Jaspr web developer');
          expect(page.querySelector('title')!.text, jasprDevelopmentTitle);
          expect(
            page.querySelector('a[href="$prefix/case-study/expert-listing/"]'),
            isNotNull,
          );
          expect(
            page.querySelector('a[href="$prefix/case-study/findaphone/"]'),
            isNotNull,
          );
          expect(
            page.querySelector('a[href="$prefix/case-study/ester/"]'),
            isNotNull,
          );
          expect(
            page.querySelector('a[href="mailto:princenna@proton.me"]'),
            isNotNull,
          );
        },
      );

      test('about retains biography, contact links, and lazy photos', () async {
        final page = await renderPage('/about');
        expect(page.querySelector('h1')!.text, 'About');
        expect(
          page.querySelectorAll('.bio-paragraph').map((p) => p.text.trim()),
          bioParagraphs,
        );
        expect(
          page
              .querySelectorAll('.contact-link')
              .map((a) => a.attributes['href']),
          socialLinks.map((link) => link.url),
        );
        for (final image in page.querySelectorAll('.interest-gallery img')) {
          expect(image.attributes['src'], startsWith('$prefix/images/'));
          expect(image.attributes['loading'], 'lazy');
        }
      });

      test(
        'Ester explains the product and links to the live website',
        () async {
          final page = await renderPage('/case-study/ester');
          expect(
            page.querySelector('title')!.text,
            contains('Visitor Access Through WhatsApp'),
          );
          expect(
            page.body!.text,
            contains('Residents create and share visitor codes.'),
          );
          expect(page.body!.text, contains('self-hosted Supabase'));
          expect(
            page.querySelector('.hero-ctas a[href="https://ester.ng"]'),
            isNotNull,
          );
          expect(
            page.querySelector('.hero-ctas a[href*="github.com"]'),
            isNull,
          );
        },
      );

      for (final study in caseStudies) {
        test('${study.slug} is complete without browser hydration', () async {
          final page = await renderPage('/case-study/${study.slug}');
          expect(page.querySelector('h1')!.text, study.title);
          expect(
            page.querySelectorAll('article h2').map((h2) => h2.text),
            study.sections.map((section) => section.title),
          );
          final links = page.querySelectorAll('.hero-ctas a[target="_blank"]');
          expect(
            links.map((a) => a.attributes['href']),
            study.externalLinks.map((link) => link.url),
          );
          for (final link in links) {
            expect(link.attributes['rel'], 'noopener noreferrer');
          }
          expect(
            page.querySelector('.back-link')!.attributes['href'],
            '$prefix/',
          );
        });
      }
    });
  }
}
