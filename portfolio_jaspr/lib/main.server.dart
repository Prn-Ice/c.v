/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
library;

import 'dart:io';

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'config.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  basePath = Platform.environment['BASE_PATH'] ?? '';

  runApp(
    Document(
      title: 'Prince Nna | Senior Full Stack Engineer',
      lang: 'en',
      base: basePath.isNotEmpty ? basePath : null,
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1.0',
      meta: {
        'description':
            'Senior Full Stack Engineer specializing in Flutter, React, '
            'and cross-platform development',
        'og:title': 'Prince Nna | Senior Full Stack Engineer',
        'og:description':
            'Senior Full Stack Engineer specializing in Flutter, React, '
            'and cross-platform development',
        'og:type': 'website',
        'og:url': 'https://portfolio.prnice.me/jaspr',
      },
      head: [
        link(rel: 'icon', type: 'image/svg+xml', href: '$basePath/favicon.svg'),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap',
        ),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/icon?family=Material+Icons+Outlined',
        ),
        script(
          attributes: {'type': 'application/ld+json'},
          content: '''
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Prince Nna",
  "jobTitle": "Senior Full Stack Engineer",
  "url": "https://portfolio.prnice.me/jaspr",
  "sameAs": [
    "https://github.com/Prn-Ice",
    "https://linkedin.com/in/princenna",
    "https://www.youtube.com/@prn-ice"
  ]
}
''',
        ),
        script(
          defer: true,
          content: '''
const toggle = document.getElementById('theme-toggle');
const html = document.documentElement;
const stored = localStorage.getItem('theme');
if (stored) html.setAttribute('data-theme', stored);
toggle?.addEventListener('click', () => {
  const next = html.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
  html.setAttribute('data-theme', next);
  localStorage.setItem('theme', next);
  toggle.querySelector('span').textContent =
    next === 'light' ? 'light_mode' : 'dark_mode';
});
''',
        ),
      ],
      styles: appStyles,
      body: App(),
    ),
  );
}
