# Jaspr Portfolio Site — Design Document

## Goal

Create a Jaspr SSG version of the Flutter portfolio site at `portfolio.prnice.me/jaspr/`. Both sites share content via a pure Dart package. The Jaspr version provides full SEO (crawlable HTML/CSS) while the Flutter version delivers the interactive canvas experience. Each site cross-references the other.

## Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Hosting | Same domain, `/jaspr/` path | Single deployment, clean URLs |
| Visual parity | Pixel-close CSS match | Demonstrates same design across frameworks |
| Icon sharing | `AppIcon` enum | Type-safe, framework-agnostic |
| Rendering mode | SSG (static site generation) | Fixed content, fastest load, GitHub Pages compatible |
| About page data | Shared constants (bio, interests, credits) | Same treatment as case studies and skills |

## Architecture

### Mono-repo Structure

```
c.v/
├── shared/                         ← Pure Dart package (no Flutter, no Jaspr)
│   ├── lib/
│   │   ├── shared.dart             ← Barrel export
│   │   ├── models/
│   │   │   ├── case_study.dart     ← CaseStudy, CaseStudySection
│   │   │   ├── skill_category.dart ← SkillCategory
│   │   │   ├── social_link.dart    ← SocialLink (uses AppIcon, not IconData)
│   │   │   └── interest.dart       ← Interest (uses AppIcon, not IconData)
│   │   ├── data/
│   │   │   ├── case_studies.dart   ← 7 case studies
│   │   │   ├── skills.dart         ← 6 skill categories
│   │   │   ├── social_links.dart   ← 3 social links
│   │   │   ├── interests.dart      ← 6 interests
│   │   │   └── bio.dart            ← Bio paragraphs, site credits text
│   │   └── app_icon.dart           ← AppIcon enum
│   └── pubspec.yaml                ← name: shared, no framework deps
│
├── portfolio/                      ← Flutter Web (existing, refactored)
│   ├── lib/
│   │   ├── core/
│   │   │   ├── data/               ← DELETED — moved to shared/
│   │   │   ├── icons/
│   │   │   │   └── icon_mapper.dart ← AppIcon → IconData mapping
│   │   │   └── ...
│   │   └── ...
│   └── pubspec.yaml                ← depends on shared/ via path
│
├── portfolio_jaspr/                ← Jaspr SSG (new)
│   ├── lib/
│   │   ├── app.dart                ← Root Document component, router setup
│   │   ├── components/
│   │   │   ├── glass_card.dart     ← CSS glassmorphic card
│   │   │   ├── tech_tag.dart       ← CSS pill tag
│   │   │   ├── bumpable_wrap.dart  ← CSS chain-reaction hover
│   │   │   ├── nav_bar.dart        ← Site nav with theme toggle
│   │   │   ├── footer.dart         ← Footer with social icons
│   │   │   ├── section_container.dart
│   │   │   └── cross_ref_banner.dart ← "View in Flutter →" banner
│   │   ├── pages/
│   │   │   ├── home_page.dart      ← Hero, bento grid, skills
│   │   │   ├── about_page.dart     ← Bio, interests, contact
│   │   │   └── case_study_page.dart ← Detail page (1 route per slug)
│   │   ├── styles/
│   │   │   ├── colors.dart         ← CSS color tokens matching AppColors
│   │   │   ├── typography.dart     ← Google Fonts CDN setup
│   │   │   ├── glass.dart          ← Glassmorphic card styles
│   │   │   ├── animations.dart     ← Entrance animations, hover effects
│   │   │   └── responsive.dart     ← Breakpoint mixins
│   │   ├── icons/
│   │   │   └── icon_mapper.dart    ← AppIcon → Material Icons web font class
│   │   └── main.dart               ← Jaspr entry point
│   ├── web/
│   │   ├── index.html              ← Loading splash, meta tags
│   │   └── favicon.svg             ← Same orange P favicon
│   └── pubspec.yaml                ← depends on shared/, jaspr, jaspr_router
│
├── .github/workflows/
│   └── deploy.yml                  ← Builds both, merges output, deploys
└── CNAME
```

### Shared Package (`shared/`)

Pure Dart — zero framework dependencies. Contains:

**Models** (no `IconData`, no Flutter imports):
- `CaseStudy` + `CaseStudySection` — unchanged except import path
- `SkillCategory` — unchanged
- `SocialLink` — `IconData icon` replaced with `AppIcon icon`
- `Interest` — new shared model (currently inline in about_page.dart)

**`AppIcon` enum:**
```dart
enum AppIcon {
  code, search, camera, headphones, terminal, public,
  sportsEsports, sportsSoccer, person, email, photoLibrary;
}
```

Flutter maps: `AppIcon.code → Icons.code`
Jaspr maps: `AppIcon.code → 'code'` (Material Icons web font ligature)

**Data files:**
- `caseStudies` — 7 case studies (moved from `portfolio/lib/core/data/`)
- `skillCategories` — 6 categories (moved)
- `socialLinks` — 3 links (moved, now uses `AppIcon`)
- `interests` — 6 interests (extracted from about_page.dart)
- `bioParagraphs` — 4 paragraph strings
- `siteCredits` — credits text (without the Rob's site link — links are UI-specific)
- `flutterSiteUrl` / `jasprSiteUrl` — cross-reference URLs

### Jaspr Site (`portfolio_jaspr/`)

**Rendering:** SSG mode. `jaspr build` pre-renders all routes to static HTML.

**Routing** (`jaspr_router`):
```
/jaspr/           → HomePage
/jaspr/about      → AboutPage
/jaspr/case-study/search-architecture → CaseStudyPage(slug)
/jaspr/case-study/search-2-command    → CaseStudyPage(slug)
... (1 route per case study, generated from shared data)
```

**Theme system (CSS):**
- Dark mode default, toggle via `data-theme="light"` attribute on `<html>`
- Toggle persisted to `localStorage`
- Colors defined as CSS custom properties:
  ```css
  :root {
    --accent: #E95420;
    --surface: #0F0F0F;
    --surface-container: #1A1A1A;
    --on-surface: #F5F5F5;
    --on-surface-variant: #B0B0B0;
    --glass-bg: rgba(255,255,255,0.03);
    --glass-border: rgba(255,255,255,0.1);
  }
  [data-theme="light"] {
    --surface: #FAFAFA;
    --surface-container: #FFFFFF;
    --on-surface: #1A1A1A;
    --on-surface-variant: #666666;
    --glass-bg: var(--surface-container);
    --glass-border: rgba(0,0,0,0.06);
  }
  ```
- Typography: Plus Jakarta Sans + JetBrains Mono via Google Fonts `<link>`

**CSS effects (matching Flutter):**

| Flutter | Jaspr CSS |
|---------|-----------|
| `BackdropFilter(blur: 12)` | `backdrop-filter: blur(12px)` |
| `AnimatedScale(1.02)` on hover | `transform: scale(1.02)` with `transition` |
| BumpableWrap chain reaction | `transition: transform` + `:hover ~ .tag` sibling selectors with decreasing `translateX` |
| `flutter_animate` stagger | `@keyframes fadeSlideUp` with per-element `animation-delay` |
| Responsive `LayoutBuilder` | CSS Grid + `@media` queries at 480/600/1024px |

**Cross-reference banner:**
Subtle bar above footer or below nav: "This is the SEO-friendly Jaspr version. [View the interactive Flutter version →](https://portfolio.prnice.me)"

Flutter site gets the inverse: "View the Jaspr version →" linking to `/jaspr/`

### SEO (Jaspr-specific)

Each page gets:
- Semantic HTML: `<h1>`, `<h2>`, `<p>`, `<article>`, `<section>`, `<nav>`
- `<meta name="description">` unique per page
- Open Graph tags (`og:title`, `og:description`, `og:type`, `og:url`)
- `<link rel="canonical" href="https://portfolio.prnice.me/jaspr/...">` per page
- Structured data (`application/ld+json`): `Person` schema with `sameAs` links

Site-wide:
- Generated `sitemap.xml` listing all routes
- `robots.txt` allowing all crawlers

### Deployment

Single GitHub Actions workflow:

```yaml
jobs:
  build:
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2  # For Flutter
      - uses: dart-lang/setup-dart@v1     # For Jaspr CLI

      # Build Flutter
      - run: flutter pub get
        working-directory: portfolio
      - run: flutter build web --wasm --base-href /
        working-directory: portfolio

      # Build Jaspr
      - run: dart pub global activate jaspr_cli
      - run: dart pub get
        working-directory: portfolio_jaspr
      - run: jaspr build
        working-directory: portfolio_jaspr

      # Merge outputs
      - run: cp -r portfolio_jaspr/build/jaspr portfolio/build/web/jaspr

      # Copy CNAME
      - run: cp CNAME portfolio/build/web/CNAME

      # Upload
      - uses: actions/upload-pages-artifact@v3
        with:
          path: portfolio/build/web
```

### Flutter Refactor (Minimal)

Changes to `portfolio/` to use shared package:
1. Add `shared/` as path dependency in `pubspec.yaml`
2. Create `lib/core/icons/icon_mapper.dart` — `IconData mapIcon(AppIcon icon)` function
3. Update imports in data-consuming files to point to `package:shared/...`
4. Delete `lib/core/data/` and `lib/features/case_study/models/` (moved to shared)
5. Extract inline about page data (bio, interests) to shared, import back
6. Add cross-reference banner component linking to `/jaspr/`
