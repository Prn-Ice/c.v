# Jaspr Portfolio Site Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a Jaspr SSG portfolio site at `/jaspr/` sharing content with the Flutter site via a pure Dart package, with pixel-close CSS styling and full SEO.

**Architecture:** Mono-repo with three packages — `shared/` (pure Dart models + data), `portfolio/` (Flutter, refactored), `portfolio_jaspr/` (Jaspr SSG). Single GitHub Actions workflow builds both and deploys to GitHub Pages.

**Tech Stack:** Dart, Jaspr (^0.22.1), jaspr_router (^0.6.0), jaspr_builder, CSS custom properties, Material Icons web font

---

## Task 1: Create Shared Dart Package — Models

**Files:**
- Create: `shared/pubspec.yaml`
- Create: `shared/lib/shared.dart`
- Create: `shared/lib/app_icon.dart`
- Create: `shared/lib/models/case_study.dart`
- Create: `shared/lib/models/skill_category.dart`
- Create: `shared/lib/models/social_link.dart`
- Create: `shared/lib/models/interest.dart`

**Step 1: Create `shared/pubspec.yaml`**

```yaml
name: shared
description: Shared models and data for portfolio sites
publish_to: 'none'

environment:
  sdk: ^3.10.0
```

**Step 2: Create `shared/lib/app_icon.dart`**

```dart
/// Framework-agnostic icon identifiers.
/// Flutter maps these to [IconData], Jaspr maps to Material Icons web font ligatures.
enum AppIcon {
  code,
  search,
  camera,
  headphones,
  terminal,
  public,
  sportsEsports,
  sportsSoccer,
  person,
  email,
  photoLibrary,
  arrowBack,
  menu,
  close,
  lightMode,
  darkMode,
}
```

**Step 3: Create `shared/lib/models/case_study.dart`**

Copy from `portfolio/lib/features/case_study/models/case_study.dart` — it has no Flutter imports, so it moves unchanged.

```dart
class CaseStudy {
  const CaseStudy({
    required this.slug,
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.tags,
    required this.sections,
    this.repoUrl,
    this.liveUrl,
    this.dateRange,
    this.role,
    this.gridSpan = 1,
  });

  final String slug;
  final String title;
  final String subtitle;
  final String summary;
  final List<String> tags;
  final List<CaseStudySection> sections;
  final String? repoUrl;
  final String? liveUrl;
  final String? dateRange;
  final String? role;
  final int gridSpan;
}

class CaseStudySection {
  const CaseStudySection({
    required this.title,
    required this.content,
    this.bulletPoints,
  });

  final String title;
  final String content;
  final List<String>? bulletPoints;
}
```

**Step 4: Create `shared/lib/models/skill_category.dart`**

```dart
class SkillCategory {
  const SkillCategory({required this.name, required this.skills});
  final String name;
  final List<String> skills;
}
```

**Step 5: Create `shared/lib/models/social_link.dart`**

```dart
import '../app_icon.dart';

class SocialLink {
  const SocialLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final AppIcon icon;
}
```

**Step 6: Create `shared/lib/models/interest.dart`**

```dart
import '../app_icon.dart';

class Interest {
  const Interest({
    required this.title,
    required this.description,
    required this.icon,
    this.images = const [],
    this.linkText,
    this.linkUrl,
  });

  final String title;
  final String description;
  final AppIcon icon;
  final List<String> images;
  final String? linkText;
  final String? linkUrl;
}
```

**Step 7: Create barrel export `shared/lib/shared.dart`**

```dart
export 'app_icon.dart';
export 'models/case_study.dart';
export 'models/interest.dart';
export 'models/skill_category.dart';
export 'models/social_link.dart';
```

**Step 8: Verify**

```bash
cd shared && dart pub get && dart analyze
```

**Step 9: Commit**

```bash
git add shared/
git commit -m "feat: create shared Dart package with models and AppIcon enum"
```

---

## Task 2: Create Shared Package — Data

**Files:**
- Create: `shared/lib/data/case_studies.dart`
- Create: `shared/lib/data/skills.dart`
- Create: `shared/lib/data/social_links.dart`
- Create: `shared/lib/data/interests.dart`
- Create: `shared/lib/data/bio.dart`
- Create: `shared/lib/data/site_config.dart`
- Modify: `shared/lib/shared.dart` — add data exports

**Step 1: Create `shared/lib/data/case_studies.dart`**

Copy the full `caseStudies` list from `portfolio/lib/core/data/case_studies.dart`, updating the import to use the local model:

```dart
import '../models/case_study.dart';

const caseStudies = [
  // Full list of 7 case studies — copy verbatim from
  // portfolio/lib/core/data/case_studies.dart
  // Only change: import path
];
```

**Step 2: Create `shared/lib/data/skills.dart`**

```dart
import '../models/skill_category.dart';

const skillCategories = [
  // Full list of 6 categories — copy verbatim from
  // portfolio/lib/core/data/skills.dart
];
```

**Step 3: Create `shared/lib/data/social_links.dart`**

```dart
import '../app_icon.dart';
import '../models/social_link.dart';

const socialLinks = [
  SocialLink(
    label: 'GitHub',
    url: 'https://github.com/Prn-Ice',
    icon: AppIcon.code,
  ),
  SocialLink(
    label: 'LinkedIn',
    url: 'https://linkedin.com/in/princenna',
    icon: AppIcon.person,
  ),
  SocialLink(
    label: 'Email',
    url: 'mailto:stormprince77@gmail.com',
    icon: AppIcon.email,
  ),
];
```

**Step 4: Create `shared/lib/data/interests.dart`**

```dart
import '../app_icon.dart';
import '../models/interest.dart';

const interests = [
  Interest(
    title: 'Photography & Nature',
    description:
        'I like to take pictures, and I like to be in the green. '
        'Getting outside with a camera is how I reset.',
    icon: AppIcon.camera,
  ),
  Interest(
    title: 'Audio & Hardware',
    description:
        'I love audio hardware and music. From custom fan curves to '
        'headphone amps — if it has a circuit board, I\'m interested.',
    icon: AppIcon.headphones,
  ),
  Interest(
    title: 'Linux & NixOS',
    description:
        'Declarative system configuration with Nix Flakes and '
        'Home-Manager. My development environment is code.',
    icon: AppIcon.terminal,
  ),
  Interest(
    title: 'Open Source',
    description:
        '50+ issues filed, contributions to Stacked, OpenRGB, and '
        'more. I believe in building in the open.',
    icon: AppIcon.public,
  ),
  Interest(
    title: 'Gaming & Tech',
    description:
        'I play video games sometimes — a lot less than I wish I could. '
        'I keep up with gaming and tech news and started a YouTube channel.',
    icon: AppIcon.sportsEsports,
    linkText: 'started a YouTube channel',
    linkUrl: 'https://www.youtube.com/@prn-ice',
  ),
  Interest(
    title: 'Manchester United',
    description: 'Through thick and thin. Mostly thin, lately.',
    icon: AppIcon.sportsSoccer,
  ),
];
```

**Step 5: Create `shared/lib/data/bio.dart`**

```dart
const bioParagraphs = [
  'I\'ve loved computers since I was a kid. Growing up, '
      'I was always tinkering with my dad\'s old PC — wanting '
      'games we couldn\'t afford, wanting software that wasn\'t '
      'designed to run on it, wanting to make it do things it '
      'was never meant to do. That\'s how this all started. My '
      'dad saw how much I loved it and told me, "Do you know '
      'you can study this stuff in school?" As I get older, I '
      'realise the weight of those little decisions and forks '
      'in the road a parent can give their child.',
  'Since then, I studied Computer Science at Bells '
      'University of Technology and went on to work with '
      'brilliant people — at Chigisoft, and now at Keller '
      'Williams. I\'ve seen all types of software: from '
      'hostel-made pharmacy management apps to random kernel '
      'patches on a Chinese website to enterprise applications '
      'handling millions of transactions. I\'ve come to '
      'understand not just how we build software, but why. '
      'Sometimes we build it because it solves a problem. '
      'Sometimes because "wouldn\'t that look really cool?" '
      'Sometimes because we know we can make someone\'s life '
      'just a bit better with some code.',
  'The world is changing, the tools are changing, and I\'m '
      'here to keep up. I\'m deepening my understanding of '
      'AI-assisted workflows, backend frameworks, and the full '
      'stack — because the modern developer needs to understand '
      'it all. As one of my teammates put it: "Currently '
      'learning everything." I started learning about computers '
      'as a kid, and I haven\'t stopped.',
  'Most of this website was built with AI assistance, but '
      'I wanted this section to be authentically me. I\'m not '
      'going for professional here. This is an introduction, '
      'but also a reminder to myself of what I am — and that '
      'I can\'t stop. I won\'t stop. Not just for myself, but '
      'for the people who made me. For the people who believed '
      'in me. For all the solutions I can still contribute to.',
];

/// Site credits text. The link to Rob's site is handled by each
/// framework's UI layer since link rendering differs.
const siteCreditsPrefix =
    'This site is Android UI meets Yaru + Bento Cards. '
    'Yaru because I\'ve been working on LegionLinuxFrontend '
    'for a while \u2014 it uses the Yaru Flutter theme and I\'m '
    'feeling orange today. Inspiration came from my co-worker ';

const siteCreditsLinkText = 'Rob\'s site';
const siteCreditsLinkUrl = 'https://robdahl.dev';
```

**Step 6: Create `shared/lib/data/site_config.dart`**

```dart
const flutterSiteUrl = 'https://portfolio.prnice.me';
const jasprSiteUrl = 'https://portfolio.prnice.me/jaspr';
const siteTitle = 'Prince Nna | Senior Full Stack Engineer';
const siteDescription =
    'Senior Full Stack Engineer specializing in Flutter, React, '
    'and cross-platform development';
const heroSummary =
    'Senior Full Stack Engineer with 6+ years of production experience '
    'and a proven track record of cross-platform delivery, independently '
    'owning and evolving complex search architectures across Flutter, '
    'React, and Handlebars CMS ecosystems.';
```

**Step 7: Update barrel export `shared/lib/shared.dart`**

```dart
export 'app_icon.dart';
export 'data/bio.dart';
export 'data/case_studies.dart';
export 'data/interests.dart';
export 'data/site_config.dart';
export 'data/skills.dart';
export 'data/social_links.dart';
export 'models/case_study.dart';
export 'models/interest.dart';
export 'models/skill_category.dart';
export 'models/social_link.dart';
```

**Step 8: Verify**

```bash
cd shared && dart analyze
```

**Step 9: Commit**

```bash
git add shared/
git commit -m "feat: add shared content data (case studies, skills, bio, interests)"
```

---

## Task 3: Refactor Flutter Portfolio to Use Shared Package

**Files:**
- Modify: `portfolio/pubspec.yaml` — add shared dependency
- Create: `portfolio/lib/core/icons/icon_mapper.dart`
- Modify: `portfolio/lib/core/data/case_studies.dart` — re-export from shared
- Modify: `portfolio/lib/core/data/skills.dart` — re-export from shared
- Modify: `portfolio/lib/core/data/social_links.dart` — re-export + map icons
- Modify: `portfolio/lib/features/about/view/about_page.dart` — use shared data
- Delete: `portfolio/lib/features/case_study/models/case_study.dart`

**Step 1: Add shared dependency to `portfolio/pubspec.yaml`**

Add under `dependencies:`:

```yaml
  shared:
    path: ../shared
```

Run: `flutter pub get`

**Step 2: Create `portfolio/lib/core/icons/icon_mapper.dart`**

```dart
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

IconData mapIcon(AppIcon icon) {
  return switch (icon) {
    AppIcon.code => Icons.code,
    AppIcon.search => Icons.search,
    AppIcon.camera => Icons.camera_alt_outlined,
    AppIcon.headphones => Icons.headphones_outlined,
    AppIcon.terminal => Icons.terminal,
    AppIcon.public => Icons.public,
    AppIcon.sportsEsports => Icons.sports_esports_outlined,
    AppIcon.sportsSoccer => Icons.sports_soccer,
    AppIcon.person => Icons.person,
    AppIcon.email => Icons.email,
    AppIcon.photoLibrary => Icons.photo_library_outlined,
    AppIcon.arrowBack => Icons.arrow_back_rounded,
    AppIcon.menu => Icons.menu,
    AppIcon.close => Icons.close_rounded,
    AppIcon.lightMode => Icons.light_mode,
    AppIcon.darkMode => Icons.dark_mode,
  };
}
```

**Step 3: Update data files to re-export from shared**

Replace `portfolio/lib/core/data/case_studies.dart`:

```dart
export 'package:shared/data/case_studies.dart';
```

Replace `portfolio/lib/core/data/skills.dart`:

```dart
export 'package:shared/data/skills.dart';
```

Replace `portfolio/lib/core/data/social_links.dart`:

The Flutter `SocialLink` in widgets still expects `IconData`, so create a Flutter-specific wrapper:

```dart
import 'package:flutter/material.dart';
import 'package:shared/shared.dart' as shared;

import '../icons/icon_mapper.dart';

class SocialLink {
  const SocialLink._({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

final socialLinks = shared.socialLinks
    .map((l) => SocialLink._(
          label: l.label,
          url: l.url,
          icon: mapIcon(l.icon),
        ))
    .toList();
```

**Step 4: Delete the old model file**

Delete `portfolio/lib/features/case_study/models/case_study.dart`.

Update its barrel file or any direct imports to use `package:shared/models/case_study.dart` instead. Search for all files importing the old path:

```bash
grep -r "case_study/models/case_study" portfolio/lib/ --files-with-matches
```

Update each import to:

```dart
import 'package:shared/models/case_study.dart';
```

**Step 5: Update about_page.dart to use shared data**

Import shared data for bio paragraphs, interests, and credits. Update the `_interests` list to reference `shared.interests` mapped through `mapIcon`. Update bio paragraph `Text` widgets to iterate over `bioParagraphs`. Update site credits to use `siteCreditsPrefix`, `siteCreditsLinkText`, `siteCreditsLinkUrl`.

This is the most involved step — the about page has inline data that needs to reference shared constants while keeping the Flutter UI logic (Text.rich, WidgetSpan, etc.).

**Step 6: Verify**

```bash
cd portfolio && flutter analyze && flutter build web --wasm
```

Expected: No issues, build succeeds.

**Step 7: Commit**

```bash
git add -A
git commit -m "refactor: migrate portfolio to shared Dart package for models and data"
```

---

## Task 4: Scaffold Jaspr Project

**Files:**
- Create: `portfolio_jaspr/pubspec.yaml`
- Create: `portfolio_jaspr/lib/main.dart`
- Create: `portfolio_jaspr/web/index.html`
- Create: `portfolio_jaspr/web/favicon.svg`

**Step 1: Create `portfolio_jaspr/pubspec.yaml`**

```yaml
name: portfolio_jaspr
description: "Prince Nna's portfolio site — Jaspr SSG version"
publish_to: 'none'

environment:
  sdk: ^3.10.0

dependencies:
  jaspr: ^0.22.1
  jaspr_router: ^0.6.0
  shared:
    path: ../shared

dev_dependencies:
  build_runner: ^2.4.0
  build_web_compilers: ^4.4.6
  jaspr_builder: ^0.22.1
  jaspr_lints: ^0.3.0

jaspr:
  mode: static
```

**Step 2: Create `portfolio_jaspr/lib/main.dart`**

```dart
import 'package:jaspr/server.dart';

import 'app.dart';

void main() {
  runApp(
    Document(
      title: 'Prince Nna | Senior Full Stack Engineer',
      lang: 'en',
      base: '/jaspr',
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
        link(rel: 'icon', type: 'image/svg+xml', href: '/jaspr/favicon.svg'),
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
      ],
      styles: appStyles,
      body: App(),
    ),
  );
}
```

**Step 3: Create `portfolio_jaspr/lib/app.dart`** (minimal placeholder)

```dart
import 'package:jaspr/jaspr.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      h1([text('Prince Nna')]),
      p([text('Portfolio — Jaspr SSG version. Coming soon.')]),
    ]);
  }
}

// Placeholder styles — will be built out in Task 5
final appStyles = <StyleRule>[];
```

**Step 4: Create `portfolio_jaspr/web/index.html`**

```html
<!DOCTYPE html>
<html>
<head>
  <base href="/jaspr/">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Prince Nna | Senior Full Stack Engineer</title>
  <style>
    body {
      margin: 0;
      background-color: #0F0F0F;
      overflow: hidden;
    }
    #loading {
      position: fixed;
      inset: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 24px;
      z-index: 9999;
      transition: opacity 0.3s ease-out;
    }
    #loading.fade-out { opacity: 0; }
    #loading .name {
      font-family: system-ui, -apple-system, sans-serif;
      font-size: 18px;
      font-weight: 600;
      color: #F5F5F5;
      letter-spacing: 0.5px;
    }
    #loading .bar-track {
      width: 120px;
      height: 3px;
      background: #242424;
      border-radius: 2px;
      overflow: hidden;
    }
    #loading .bar-fill {
      width: 40%;
      height: 100%;
      background: #E95420;
      border-radius: 2px;
      animation: slide 1.2s ease-in-out infinite;
    }
    @keyframes slide {
      0% { transform: translateX(-100%); }
      100% { transform: translateX(350%); }
    }
  </style>
</head>
<body>
  <div id="loading">
    <span class="name">Prince Nna</span>
    <div class="bar-track"><div class="bar-fill"></div></div>
  </div>
</body>
</html>
```

**Step 5: Copy favicon**

```bash
cp portfolio/web/favicon.svg portfolio_jaspr/web/favicon.svg
```

**Step 6: Verify Jaspr builds**

```bash
cd portfolio_jaspr && dart pub get && jaspr build
```

Expected: Build succeeds, produces `build/jaspr/` with static HTML.

**Step 7: Commit**

```bash
git add portfolio_jaspr/
git commit -m "feat: scaffold Jaspr SSG portfolio project with shared dependency"
```

---

## Task 5: Jaspr Theme System — CSS Styles

**Files:**
- Create: `portfolio_jaspr/lib/styles/colors.dart`
- Create: `portfolio_jaspr/lib/styles/typography.dart`
- Create: `portfolio_jaspr/lib/styles/glass.dart`
- Create: `portfolio_jaspr/lib/styles/animations.dart`
- Create: `portfolio_jaspr/lib/styles/responsive.dart`
- Create: `portfolio_jaspr/lib/styles/app_styles.dart`
- Modify: `portfolio_jaspr/lib/app.dart` — import real styles

**Step 1: Create `portfolio_jaspr/lib/styles/colors.dart`**

Define CSS custom properties for light/dark theme using Jaspr's `css()` API. Dark is default, light via `[data-theme="light"]`.

```dart
import 'package:jaspr/jaspr.dart';

final colorStyles = [
  css(':root').styles(raw: {
    '--accent': '#E95420',
    '--accent-light': '#FF7043',
    '--surface': '#0F0F0F',
    '--surface-container': '#1A1A1A',
    '--surface-container-high': '#242424',
    '--on-surface': '#F5F5F5',
    '--on-surface-variant': '#B0B0B0',
    '--glass-bg': 'rgba(255,255,255,0.03)',
    '--glass-border': 'rgba(255,255,255,0.1)',
    '--shadow': 'none',
  }),
  css('[data-theme="light"] ').styles(raw: {
    '--surface': '#FAFAFA',
    '--surface-container': '#FFFFFF',
    '--surface-container-high': '#F0F0F0',
    '--on-surface': '#1A1A1A',
    '--on-surface-variant': '#666666',
    '--glass-bg': 'var(--surface-container)',
    '--glass-border': 'rgba(0,0,0,0.06)',
    '--shadow': '0 2px 8px rgba(0,0,0,0.05)',
  }),
];
```

Note: If Jaspr's `css().styles()` does not support a `raw` map for custom properties, use a `RawStyleRule` or embed them via a `<style>` tag in the Document head instead. Verify against Jaspr's API during implementation and adapt accordingly.

**Step 2: Create `portfolio_jaspr/lib/styles/typography.dart`**

```dart
import 'package:jaspr/jaspr.dart';

final typographyStyles = [
  css('body').styles(
    fontFamily: "'Plus Jakarta Sans', system-ui, sans-serif",
    color: Color.variable('--on-surface'),
    backgroundColor: Color.variable('--surface'),
  ),
  css('h1').styles(fontSize: 3.5.rem, fontWeight: FontWeight.w700),
  css('h2').styles(fontSize: 2.rem, fontWeight: FontWeight.w700),
  css('h3').styles(fontSize: 1.5.rem, fontWeight: FontWeight.w600),
  css('code, pre').styles(
    fontFamily: "'JetBrains Mono', monospace",
  ),
  css('a').styles(
    color: Color.variable('--accent'),
    textDecoration: TextDecoration.none,
  ),
  css('a:hover').styles(
    textDecoration: TextDecoration.underline,
  ),
];
```

Note: Jaspr's `Color.variable()` or equivalent CSS variable reference syntax may differ. Verify during implementation. If needed, use raw CSS strings.

**Step 3–5: Create glass, animations, responsive styles**

These follow the same pattern — define CSS rules using Jaspr's style API or raw CSS that matches the Flutter site's visual effects. Key rules:

- **Glass:** `.glass-card` with `backdrop-filter: blur(12px)`, border, bg from CSS vars, hover `transform: scale(1.02)`
- **Animations:** `@keyframes fadeSlideUp`, `.stagger-1` through `.stagger-6` with increasing `animation-delay`
- **Responsive:** Media queries at 480px, 600px, 1024px adjusting padding, font sizes, grid columns

**Step 6: Create `portfolio_jaspr/lib/styles/app_styles.dart`**

Barrel that combines all style lists:

```dart
import 'colors.dart';
import 'typography.dart';
import 'glass.dart';
import 'animations.dart';
import 'responsive.dart';

final appStyles = [
  ...colorStyles,
  ...typographyStyles,
  ...glassStyles,
  ...animationStyles,
  ...responsiveStyles,
];
```

**Step 7: Update `app.dart` to import real styles**

Replace `final appStyles = <StyleRule>[];` with import from `styles/app_styles.dart`.

**Step 8: Verify**

```bash
cd portfolio_jaspr && jaspr build
```

Inspect `build/jaspr/index.html` — confirm CSS custom properties are present in `<style>` tags.

**Step 9: Commit**

```bash
git add portfolio_jaspr/lib/styles/
git commit -m "feat: add Jaspr theme system with CSS custom properties matching Flutter site"
```

---

## Task 6: Jaspr Icon Mapper

**Files:**
- Create: `portfolio_jaspr/lib/icons/icon_mapper.dart`

**Step 1: Create the mapper**

Maps `AppIcon` to Material Icons Outlined web font ligature names:

```dart
import 'package:shared/shared.dart';

String mapIconName(AppIcon icon) {
  return switch (icon) {
    AppIcon.code => 'code',
    AppIcon.search => 'search',
    AppIcon.camera => 'camera_alt',
    AppIcon.headphones => 'headphones',
    AppIcon.terminal => 'terminal',
    AppIcon.public => 'public',
    AppIcon.sportsEsports => 'sports_esports',
    AppIcon.sportsSoccer => 'sports_soccer',
    AppIcon.person => 'person',
    AppIcon.email => 'email',
    AppIcon.photoLibrary => 'photo_library',
    AppIcon.arrowBack => 'arrow_back',
    AppIcon.menu => 'menu',
    AppIcon.close => 'close',
    AppIcon.lightMode => 'light_mode',
    AppIcon.darkMode => 'dark_mode',
  };
}
```

Usage in components: `span(classes: ['material-icons-outlined'], [text(mapIconName(icon))])`

**Step 2: Verify & commit**

```bash
cd portfolio_jaspr && dart analyze
git add portfolio_jaspr/lib/icons/
git commit -m "feat: add AppIcon to Material Icons web font mapper for Jaspr"
```

---

## Task 7: Jaspr Core Components

**Files:**
- Create: `portfolio_jaspr/lib/components/section_container.dart`
- Create: `portfolio_jaspr/lib/components/glass_card.dart`
- Create: `portfolio_jaspr/lib/components/tech_tag.dart`
- Create: `portfolio_jaspr/lib/components/bumpable_wrap.dart`
- Create: `portfolio_jaspr/lib/components/icon_span.dart`

**Step 1: Create `section_container.dart`**

```dart
import 'package:jaspr/jaspr.dart';

class SectionContainer extends StatelessComponent {
  const SectionContainer({super.key, required this.child, this.maxWidth = 1200});
  final Component child;
  final int maxWidth;

  @override
  Component build(BuildContext context) {
    return div(
      classes: ['section-container'],
      styles: Styles(
        maxWidth: maxWidth.px,
        margin: Margin.symmetric(horizontal: Unit.auto),
        padding: Padding.symmetric(horizontal: 24.px),
      ),
      [child],
    );
  }
}
```

**Step 2: Create `glass_card.dart`**

A div with `.glass-card` class (styled globally in `glass.dart`), optional `onClick`:

```dart
import 'package:jaspr/jaspr.dart';

class GlassCard extends StatelessComponent {
  const GlassCard({super.key, required this.child, this.onClick});
  final Component child;
  final VoidCallback? onClick;

  @override
  Component build(BuildContext context) {
    return div(
      classes: ['glass-card', if (onClick != null) 'clickable'],
      events: {if (onClick != null) 'click': (_) => onClick!()},
      [child],
    );
  }
}
```

**Step 3: Create `tech_tag.dart`**

```dart
import 'package:jaspr/jaspr.dart';

class TechTag extends StatelessComponent {
  const TechTag({super.key, required this.label});
  final String label;

  @override
  Component build(BuildContext context) {
    return span(classes: ['tech-tag'], [text(label)]);
  }
}
```

**Step 4: Create `bumpable_wrap.dart`**

The CSS chain-reaction hover uses adjacent sibling selectors. Each tag gets a class `.bump-tag`. Global CSS handles the animation:

```css
.bump-wrap:hover .bump-tag { transition: transform 0.6s cubic-bezier(0.33,1,0.68,1); }
.bump-tag:hover ~ .bump-tag:nth-of-type(n+1) { transform: translateX(6px); }
.bump-tag:hover ~ .bump-tag:nth-of-type(n+2) { transform: translateX(3px); }
.bump-tag:hover ~ .bump-tag:nth-of-type(n+3) { transform: translateX(2px); }
```

The component:

```dart
import 'package:jaspr/jaspr.dart';

import 'tech_tag.dart';

class BumpableWrap extends StatelessComponent {
  const BumpableWrap({super.key, required this.labels});
  final List<String> labels;

  @override
  Component build(BuildContext context) {
    return div(
      classes: ['bump-wrap'],
      [for (final label in labels) TechTag(label: label)],
    );
  }
}
```

Note: The CSS sibling selector approach is an approximation of the Flutter version's per-element animation. The exact cascade effect may need JavaScript for pixel-perfect parity. Implement CSS-only first, enhance with client-side Dart if needed.

**Step 5: Create `icon_span.dart`**

Helper for rendering Material Icons:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../icons/icon_mapper.dart';

class IconSpan extends StatelessComponent {
  const IconSpan({super.key, required this.icon, this.size = 24});
  final AppIcon icon;
  final int size;

  @override
  Component build(BuildContext context) {
    return span(
      classes: ['material-icons-outlined'],
      styles: Styles(fontSize: size.px),
      [text(mapIconName(icon))],
    );
  }
}
```

**Step 6: Verify & commit**

```bash
cd portfolio_jaspr && dart analyze
git add portfolio_jaspr/lib/components/
git commit -m "feat: add Jaspr core components (glass_card, tech_tag, bumpable_wrap)"
```

---

## Task 8: Jaspr Navigation — Nav Bar, Footer, Theme Toggle

**Files:**
- Create: `portfolio_jaspr/lib/components/nav_bar.dart`
- Create: `portfolio_jaspr/lib/components/footer.dart`
- Create: `portfolio_jaspr/lib/components/cross_ref_banner.dart`

**Step 1: Create `nav_bar.dart`**

Navigation with logo, Home/About links, theme toggle button. Theme toggle sets `data-theme` attribute on `<html>` via client-side Dart interop or JavaScript.

```dart
import 'package:jaspr/jaspr.dart';

class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: ['nav-bar'], [
      div(classes: ['nav-inner'], [
        a(href: '/jaspr/', classes: ['nav-logo'], [text('Prince Nna')]),
        div(classes: ['nav-links'], [
          a(href: '/jaspr/', [text('Home')]),
          a(href: '/jaspr/about', [text('About')]),
          button(
            id: 'theme-toggle',
            classes: ['theme-toggle'],
            [span(classes: ['material-icons-outlined'], [text('dark_mode')])],
          ),
        ]),
      ]),
    ]);
  }
}
```

Theme toggle JS (added to Document head or as inline script):

```javascript
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
```

**Step 2: Create `footer.dart`**

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import 'icon_span.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: ['site-footer'], [
      div(classes: ['footer-inner'], [
        span([text('Built with Jaspr')]),
        div(classes: ['footer-icons'], [
          for (final link in socialLinks)
            a(href: link.url, target: Target.blank, [
              IconSpan(icon: link.icon, size: 20),
            ]),
        ]),
      ]),
    ]);
  }
}
```

**Step 3: Create `cross_ref_banner.dart`**

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

class CrossRefBanner extends StatelessComponent {
  const CrossRefBanner({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: ['cross-ref-banner'], [
      text('This is the SEO-friendly Jaspr version. '),
      a(href: flutterSiteUrl, [
        text('View the interactive Flutter version \u2192'),
      ]),
    ]);
  }
}
```

**Step 4: Verify & commit**

```bash
cd portfolio_jaspr && dart analyze
git add portfolio_jaspr/lib/components/
git commit -m "feat: add Jaspr nav bar, footer, theme toggle, and cross-reference banner"
```

---

## Task 9: Jaspr Home Page

**Files:**
- Create: `portfolio_jaspr/lib/pages/home_page.dart`
- Modify: `portfolio_jaspr/lib/app.dart` — add router

**Step 1: Create `home_page.dart`**

Contains hero section, bento grid of case study cards, skills section — matching the Flutter home page layout:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/bumpable_wrap.dart';
import '../components/glass_card.dart';
import '../components/section_container.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      _heroSection(),
      _projectsSection(),
      _skillsSection(),
    ]);
  }

  Component _heroSection() {
    return SectionContainer(
      child: div(classes: ['hero'], [
        h1([text('Prince Nna')]),
        h2(classes: ['hero-subtitle'], [text('Senior Full Stack Engineer')]),
        p(classes: ['hero-summary'], [text(heroSummary)]),
        div(classes: ['hero-ctas'], [
          a(href: 'https://github.com/Prn-Ice', classes: ['btn', 'btn-filled'], [text('GitHub')]),
          a(href: 'https://linkedin.com/in/princenna', classes: ['btn', 'btn-outlined'], [text('LinkedIn')]),
          a(href: 'mailto:stormprince77@gmail.com', classes: ['btn', 'btn-outlined'], [text('Contact')]),
        ]),
      ]),
    );
  }

  Component _projectsSection() {
    return SectionContainer(
      child: div(classes: ['section'], [
        h2([text('Projects')]),
        div(classes: ['bento-grid'], [
          for (final study in caseStudies)
            div(
              classes: ['bento-cell', if (study.gridSpan > 1) 'span-2'],
              [
                GlassCard(
                  child: a(
                    href: '/jaspr/case-study/${study.slug}',
                    classes: ['card-link'],
                    [
                      h3([text(study.title)]),
                      p(classes: ['card-subtitle'], [text(study.subtitle)]),
                      p(classes: ['card-summary'], [text(study.summary)]),
                      BumpableWrap(labels: study.tags),
                    ],
                  ),
                ),
              ],
            ),
        ]),
      ]),
    );
  }

  Component _skillsSection() {
    return SectionContainer(
      child: div(classes: ['section'], [
        h2([text('Skills')]),
        div(classes: ['skills-grid'], [
          for (final cat in skillCategories)
            GlassCard(
              child: div([
                h3([text(cat.name)]),
                BumpableWrap(labels: cat.skills),
              ]),
            ),
        ]),
      ]),
    );
  }
}
```

**Step 2: Update `app.dart` with router**

```dart
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:shared/shared.dart';

import 'components/cross_ref_banner.dart';
import 'components/footer.dart';
import 'components/nav_bar.dart';
import 'pages/about_page.dart';
import 'pages/case_study_page.dart';
import 'pages/home_page.dart';
import 'styles/app_styles.dart';

export 'styles/app_styles.dart' show appStyles;

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: ['app-shell'], [
      const NavBar(),
      Router(routes: [
        Route(path: '/', builder: (_, __) => const HomePage()),
        Route(path: '/about', builder: (_, __) => const AboutPage()),
        for (final study in caseStudies)
          Route(
            path: '/case-study/${study.slug}',
            builder: (_, __) => CaseStudyPage(slug: study.slug),
          ),
      ]),
      const CrossRefBanner(),
      const Footer(),
    ]);
  }
}
```

**Step 3: Verify**

```bash
cd portfolio_jaspr && jaspr build
```

Inspect generated HTML files — confirm routes produced static HTML pages.

**Step 4: Commit**

```bash
git add portfolio_jaspr/
git commit -m "feat: add Jaspr home page with hero, bento grid, and skills sections"
```

---

## Task 10: Jaspr About Page

**Files:**
- Create: `portfolio_jaspr/lib/pages/about_page.dart`

**Step 1: Create about page**

Bio section, interests grid, contact links — using shared data:

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/glass_card.dart';
import '../components/icon_span.dart';
import '../components/section_container.dart';

class AboutPage extends StatelessComponent {
  const AboutPage({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      _bioSection(),
      _interestsSection(),
      _contactSection(),
    ]);
  }

  Component _bioSection() {
    return SectionContainer(
      child: div(classes: ['section'], [
        h1([text('About')]),
        div(classes: ['bio-content'], [
          for (final paragraph in bioParagraphs)
            p(classes: ['bio-paragraph'], [text(paragraph)]),
          p(classes: ['site-credits'], [
            text(siteCreditsPrefix),
            a(href: siteCreditsLinkUrl, [text(siteCreditsLinkText)]),
            text('.'),
          ]),
        ]),
      ]),
    );
  }

  Component _interestsSection() {
    return SectionContainer(
      child: div(classes: ['section'], [
        h2([text('Beyond Code')]),
        div(classes: ['interests-grid'], [
          for (final interest in interests)
            GlassCard(
              child: div(classes: ['interest-row'], [
                IconSpan(icon: interest.icon, size: 28),
                div(classes: ['interest-content'], [
                  h3([text(interest.title)]),
                  if (interest.linkText != null && interest.linkUrl != null)
                    p([
                      text(interest.description.split(interest.linkText!).first),
                      a(href: interest.linkUrl!, [text(interest.linkText!)]),
                      text(interest.description
                          .split(interest.linkText!)
                          .skip(1)
                          .join(interest.linkText!)),
                    ])
                  else
                    p([text(interest.description)]),
                ]),
              ]),
            ),
        ]),
      ]),
    );
  }

  Component _contactSection() {
    return SectionContainer(
      child: div(classes: ['section'], [
        h2([text('Get In Touch')]),
        div(classes: ['contact-grid'], [
          for (final link in socialLinks)
            GlassCard(
              child: a(href: link.url, target: Target.blank, classes: ['contact-link'], [
                IconSpan(icon: link.icon),
                span([text(link.label)]),
              ]),
            ),
        ]),
      ]),
    );
  }
}
```

**Step 2: Verify & commit**

```bash
cd portfolio_jaspr && jaspr build
git add portfolio_jaspr/lib/pages/about_page.dart
git commit -m "feat: add Jaspr about page with shared bio, interests, and contact data"
```

---

## Task 11: Jaspr Case Study Page

**Files:**
- Create: `portfolio_jaspr/lib/pages/case_study_page.dart`

**Step 1: Create case study detail page**

```dart
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../components/bumpable_wrap.dart';
import '../components/section_container.dart';

class CaseStudyPage extends StatelessComponent {
  const CaseStudyPage({super.key, required this.slug});
  final String slug;

  @override
  Component build(BuildContext context) {
    final study = caseStudies.where((s) => s.slug == slug).firstOrNull;

    if (study == null) {
      return SectionContainer(
        child: div(classes: ['section'], [
          h1([text('Project not found')]),
          a(href: '/jaspr/', classes: ['btn', 'btn-filled'], [text('Back to Home')]),
        ]),
      );
    }

    return div([
      // Hero
      SectionContainer(
        maxWidth: 800,
        child: div(classes: ['case-study-hero'], [
          a(href: '/jaspr/', classes: ['back-link'], [
            span(classes: ['material-icons-outlined'], [text('arrow_back')]),
            text(' Back to Projects'),
          ]),
          h1([text(study.title)]),
          if (study.role != null)
            p(classes: ['role'], [text(study.role!)]),
          if (study.dateRange != null)
            p(classes: ['date-range'], [text(study.dateRange!)]),
          BumpableWrap(labels: study.tags),
        ]),
      ),
      // Sections
      SectionContainer(
        maxWidth: 800,
        child: div([
          for (final section in study.sections)
            article(classes: ['case-study-section'], [
              h2([text(section.title)]),
              p([text(section.content)]),
              if (section.bulletPoints != null)
                ul([
                  for (final point in section.bulletPoints!)
                    li([text(point)]),
                ]),
            ]),
          if (study.repoUrl != null)
            a(
              href: study.repoUrl!,
              target: Target.blank,
              classes: ['btn', 'btn-outlined'],
              [
                span(classes: ['material-icons-outlined'], [text('code')]),
                text(' View on GitHub'),
              ],
            ),
          div(classes: ['back-nav'], [
            a(href: '/jaspr/', [
              span(classes: ['material-icons-outlined'], [text('arrow_back')]),
              text(' Back to Projects'),
            ]),
          ]),
        ]),
      ),
    ]);
  }
}
```

**Step 2: Verify & commit**

```bash
cd portfolio_jaspr && jaspr build
# Check that build/jaspr/case-study/search-architecture/index.html exists
ls build/jaspr/case-study/search-architecture/
git add portfolio_jaspr/lib/pages/case_study_page.dart
git commit -m "feat: add Jaspr case study detail page with shared data"
```

---

## Task 12: SEO — Structured Data, Sitemap, Robots

**Files:**
- Modify: `portfolio_jaspr/lib/main.dart` — add structured data to Document head
- Create: `portfolio_jaspr/web/robots.txt`

**Step 1: Add JSON-LD structured data to Document head**

In `main.dart`, add to the `head:` list:

```dart
script(
  type: 'application/ld+json',
  [],
  // Inline JSON-LD for Person schema
  rawHtml: '''
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
```

Note: Jaspr may not support `rawHtml` on script tags. If not, embed the JSON-LD via a `<script>` tag in `web/index.html` instead, or use Jaspr's `raw()` component if available.

**Step 2: Create `portfolio_jaspr/web/robots.txt`**

```
User-agent: *
Allow: /
Sitemap: https://portfolio.prnice.me/jaspr/sitemap.xml
```

**Step 3: Sitemap**

If Jaspr's SSG build automatically generates a sitemap, verify it. If not, create a static `portfolio_jaspr/web/sitemap.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url><loc>https://portfolio.prnice.me/jaspr/</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/about</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/search-architecture</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/search-2-command</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/analytics-observability</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/skyewallet</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/flutter-architecture-tooling</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/lenovo-legion-linux-frontend</loc></url>
  <url><loc>https://portfolio.prnice.me/jaspr/case-study/nixos-infrastructure</loc></url>
</urlset>
```

**Step 4: Commit**

```bash
git add portfolio_jaspr/
git commit -m "feat: add SEO structured data, sitemap, and robots.txt"
```

---

## Task 13: Add Cross-Reference Banner to Flutter Site

**Files:**
- Create: `portfolio/lib/core/widgets/cross_ref_banner.dart`
- Modify: `portfolio/lib/features/navigation/view/app_shell.dart` — add banner

**Step 1: Create Flutter cross-ref banner**

A subtle bar linking to the Jaspr version:

```dart
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class CrossRefBanner extends StatelessWidget {
  const CrossRefBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: colorScheme.surfaceContainerHigh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Also available as an SEO-friendly Jaspr site. ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse(jasprSiteUrl)),
              child: Text(
                'View Jaspr version \u2192',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**Step 2: Add to app shell**

In `app_shell.dart`, add `CrossRefBanner()` between the page content and the footer (or above the nav bar — implementer's choice based on visual fit).

**Step 3: Verify**

```bash
cd portfolio && flutter analyze && flutter build web --wasm
```

**Step 4: Commit**

```bash
git add portfolio/
git commit -m "feat: add cross-reference banner to Flutter site linking to Jaspr version"
```

---

## Task 14: Update GitHub Actions Deployment

**Files:**
- Modify: `.github/workflows/deploy.yml`

**Step 1: Update workflow to build both sites**

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: subosito/flutter-action@v2
        with:
          channel: stable

      - uses: dart-lang/setup-dart@v1

      # Shared package
      - name: Get shared dependencies
        working-directory: shared
        run: dart pub get

      # Build Flutter site
      - name: Get Flutter dependencies
        working-directory: portfolio
        run: flutter pub get

      - name: Build Flutter web (WASM)
        working-directory: portfolio
        run: flutter build web --wasm --base-href /

      # Build Jaspr site
      - name: Install Jaspr CLI
        run: dart pub global activate jaspr_cli

      - name: Get Jaspr dependencies
        working-directory: portfolio_jaspr
        run: dart pub get

      - name: Build Jaspr (SSG)
        working-directory: portfolio_jaspr
        run: jaspr build

      # Merge outputs
      - name: Merge Jaspr into Flutter build
        run: cp -r portfolio_jaspr/build/jaspr portfolio/build/web/jaspr

      # CNAME
      - name: Copy CNAME
        run: cp CNAME portfolio/build/web/CNAME

      # Upload
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: portfolio/build/web

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

**Step 2: Verify YAML is valid**

```bash
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/deploy.yml'))"
```

**Step 3: Commit**

```bash
git add .github/workflows/deploy.yml
git commit -m "ci: update deployment workflow to build both Flutter and Jaspr sites"
```

---

## Task 15: Final Verification & Polish

**Step 1: Build both sites locally**

```bash
cd portfolio && flutter build web --wasm
cd ../portfolio_jaspr && jaspr build
```

Both should succeed.

**Step 2: Merge and serve locally**

```bash
cp -r portfolio_jaspr/build/jaspr portfolio/build/web/jaspr
cd portfolio/build/web && python3 -m http.server 8080
```

Open browser:
- `http://localhost:8080` — Flutter site loads
- `http://localhost:8080/jaspr/` — Jaspr site loads with real HTML
- `http://localhost:8080/jaspr/about` — About page with bio content
- `http://localhost:8080/jaspr/case-study/search-architecture` — Case study renders

**Step 3: Verify SEO**

View source on Jaspr pages — confirm:
- `<h1>`, `<h2>`, `<p>` tags with real content (not canvas)
- `<meta>` description and Open Graph tags
- JSON-LD structured data
- Cross-reference links work in both directions

**Step 4: Responsive check**

Test Jaspr site at 375px, 768px, 1280px in DevTools. Verify:
- Grid collapses appropriately
- Nav switches to mobile layout
- Cards stack on mobile
- Text sizes scale down

**Step 5: Final commit**

```bash
git add -A
git commit -m "feat: complete Jaspr portfolio site with shared package, SEO, and cross-references"
```

---

## Task Summary

| Task | Description | Package |
|------|-------------|---------|
| 1 | Shared package — models + AppIcon enum | shared/ |
| 2 | Shared package — content data | shared/ |
| 3 | Refactor Flutter to use shared package | portfolio/ |
| 4 | Scaffold Jaspr project | portfolio_jaspr/ |
| 5 | Jaspr CSS theme system | portfolio_jaspr/ |
| 6 | Jaspr icon mapper | portfolio_jaspr/ |
| 7 | Jaspr core components | portfolio_jaspr/ |
| 8 | Jaspr nav, footer, theme toggle, cross-ref | portfolio_jaspr/ |
| 9 | Jaspr home page | portfolio_jaspr/ |
| 10 | Jaspr about page | portfolio_jaspr/ |
| 11 | Jaspr case study page | portfolio_jaspr/ |
| 12 | SEO — structured data, sitemap, robots | portfolio_jaspr/ |
| 13 | Cross-reference banner on Flutter site | portfolio/ |
| 14 | Update GitHub Actions for dual build | .github/ |
| 15 | Final verification & polish | all |
