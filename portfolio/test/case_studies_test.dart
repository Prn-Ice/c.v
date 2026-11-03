import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  test('Flutter page metadata matches the shared site description', () {
    final html = File('web/index.html').readAsStringSync();
    expect(
      html,
      contains('<meta name="description" content="$siteDescription">'),
    );
    expect(
      html,
      contains('<meta property="og:description" content="$siteDescription">'),
    );
  });

  test('case studies have unique, route-safe slugs and complete content', () {
    final slugs = caseStudies.map((study) => study.slug).toList();
    expect(slugs.toSet(), hasLength(slugs.length));

    for (final study in caseStudies) {
      expect(study.slug, matches(RegExp(r'^[a-z0-9]+(-[a-z0-9]+)*$')));
      expect(study.title, isNotEmpty);
      expect(study.summary, isNotEmpty);
      expect(study.tags, isNotEmpty);
      expect(study.sections, isNotEmpty);
      for (final section in study.sections) {
        expect(section.title, isNotEmpty);
        expect(section.content, isNotEmpty);
      }
    }
  });

  test('external links are labelled, unique HTTPS destinations', () {
    for (final study in caseStudies) {
      final urls = study.externalLinks.map((link) => link.url).toList();
      expect(urls.toSet(), hasLength(urls.length));
      for (final link in study.externalLinks) {
        expect(link.label, isNotEmpty);
        final uri = Uri.parse(link.url);
        expect(uri.scheme, 'https');
        expect(uri.host, isNotEmpty);
      }
    }
  });

  test(
    'Expert Listing is featured with the supplied website and store links',
    () {
      final study = caseStudies.first;
      expect(study.slug, 'expert-listing');
      expect(study.role, 'Mobile Developer @ Expert Listing');
      expect(study.dateRange, 'Sep 2026 – Present');
      expect(study.gridSpan, 2);
      expect(study.externalLinks.map((link) => link.url), [
        'https://ex-c4a7774adafe48d88f9a8764de7c677b.ecs.us-east-1.on.aws/',
        'https://play.google.com/store/apps/details?id=ng.expertlisting.expertlisting&hl=en',
        'https://apps.apple.com/us/app/expert-listing/id6766226080',
      ]);
    },
  );

  test('Lagos Landlord preserves the supplied Three.js demo URL', () {
    final study = caseStudies.singleWhere(
      (study) => study.slug == 'lagos-landlord',
    );
    expect(
      study.externalLinks.single.url,
      'https://lagos-landlord.vercel.app/play?ink=1',
    );
  });

  test('legacy live and repository links remain available', () {
    const study = CaseStudy(
      slug: 'example',
      title: 'Example',
      subtitle: 'Example',
      summary: 'Example',
      tags: [],
      sections: [],
      liveUrl: 'https://example.com',
      repoUrl: 'https://github.com/example/project',
      links: [CaseStudyLink(label: 'Docs', url: 'https://example.com/docs')],
    );
    expect(study.externalLinks.map((link) => link.label), [
      'View live project',
      'View on GitHub',
      'Docs',
    ]);
  });
}
