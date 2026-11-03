/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
library;

import 'dart:convert';
import 'dart:io';

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';
import 'package:shared/shared.dart';

import 'app.dart';
import 'config.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  basePath = Platform.environment['BASE_PATH'] ?? '';

  runApp(buildDocument());
}

Document buildDocument() => Document(
  title: siteTitle,
  lang: 'en',
  base: basePath.isNotEmpty ? basePath : null,
  charset: 'utf-8',
  viewport: 'width=device-width, initial-scale=1.0',
  head: [
    link(rel: 'icon', type: 'image/svg+xml', href: '$basePath/favicon.svg'),
    link(
      rel: 'preload',
      href: '$basePath/fonts/plus-jakarta-sans-latin-wght.woff2',
      attributes: {'as': 'font', 'type': 'font/woff2', 'crossorigin': ''},
    ),
    link(rel: 'stylesheet', href: '$basePath/fonts.css'),
    script(
      attributes: {'type': 'application/ld+json'},
      content: jsonEncode({
        '@context': 'https://schema.org',
        '@type': 'Person',
        '@id': '$jasprSiteUrl/#person',
        'name': 'Prince Nna',
        'jobTitle': 'Senior Full Stack Engineer',
        'url': '$jasprSiteUrl/',
        'knowsAbout': [
          'Dart',
          'Jaspr',
          'Flutter',
          'Server-side rendering',
          'Static site generation',
        ],
        'sameAs': [
          for (final social in socialLinks)
            if (social.url.startsWith('https://')) social.url,
        ],
      }),
    ),
    script(
      content: '''
const html = document.documentElement;
try {
  const stored = localStorage.getItem('theme');
  if (stored === 'light' || stored === 'dark') html.setAttribute('data-theme', stored);
} catch (_) {}
document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.getElementById('theme-toggle');
  const updateToggle = () => {
    const light = html.getAttribute('data-theme') === 'light';
    toggle?.setAttribute('aria-label', light ? 'Switch to dark theme' : 'Switch to light theme');
  };
  updateToggle();
  toggle?.addEventListener('click', () => {
    const next = html.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
    html.setAttribute('data-theme', next);
    try { localStorage.setItem('theme', next); } catch (_) {}
    updateToggle();
  });
});
''',
    ),
  ],
  styles: appStyles,
  body: App(),
);
