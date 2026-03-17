# Portfolio Site Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a Flutter Web portfolio site with Material 3, dark/light theme toggle, case study pages, and GitHub Pages deployment.

**Architecture:** Feature-first structure matching `Prn-Ice/LenovoLegionLinuxFrontend`. RiverBloc (Riverpod + Bloc) for state management. go_router for URL-based navigation. Content stored as Dart data objects. Three page types: Home (hero + bento grid), About, Case Study detail. Responsive layout with 3 breakpoints.

**Tech Stack:** Flutter Web (3.38.x stable), riverbloc, flutter_riverpod, go_router, flutter_animate, google_fonts, url_launcher, equatable. GitHub Actions for CI/CD.

**Design Reference:** See `docs/plans/2026-03-15-portfolio-site-design.md` for full visual spec. Key points: Material 3 with Google Store-tier customization, warm neutral palette, glassmorphic cards in dark mode, Plus Jakarta Sans typography, bento grid layout.

**Directory Structure:**

```
portfolio/lib/
  main.dart                                    # ProviderScope + runApp
  app/
    app.dart                                   # barrel export
    view/
      app.dart                                 # PortfolioApp MaterialApp.router
  core/
    data/                                      # shared content data
      case_studies.dart                        # all 7 case study instances
      skills.dart                              # skill categories
      social_links.dart                        # GitHub, LinkedIn, Email
    theme/
      app_colors.dart                          # color constants (dark + light)
      app_typography.dart                      # text theme via google_fonts
      app_theme.dart                           # ThemeData builders
    widgets/                                   # shared widgets
      glass_card.dart                          # glassmorphic card (dark) / shadow card (light)
      tech_tag.dart                            # pill chip for tech tags
      section_container.dart                   # max-width centered section wrapper
  features/
    home/
      view/
        home_page.dart                         # scrollable page: hero + grid + skills
      widgets/
        hero_section.dart                      # name, title, summary, CTAs
        bento_grid.dart                        # responsive grid layout
        case_study_card.dart                   # card in bento grid
        skills_section.dart                    # skill category grid
    about/
      view/
        about_page.dart                        # bio, interests, contact, resume download
    case_study/
      models/
        case_study.dart                        # CaseStudy + CaseStudySection classes
      view/
        case_study_page.dart                   # detail page with sections
      widgets/
        case_study_hero.dart                   # title, tags, back button
        case_study_section_widget.dart         # reusable section block
    navigation/
      models/
        app_routes.dart                        # GoRouter config + route paths
      view/
        app_shell.dart                         # ShellRoute body: nav + content + footer
      widgets/
        nav_bar.dart                           # responsive nav bar
        footer.dart                            # site footer
    settings/
      bloc/
        theme_bloc.dart                        # ThemeBloc
        theme_event.dart                       # ThemeToggled
        theme_state.dart                       # ThemeState with ThemeMode
      providers/
        theme_provider.dart                    # BlocProvider<ThemeBloc, ThemeState>
```

---

## Task 1: Scaffold Flutter Web Project

**Files:**
- Create: `portfolio/` (Flutter project via CLI)
- Modify: `portfolio/pubspec.yaml`
- Remove: `portfolio/test/widget_test.dart` (default test)

**Step 1: Create Flutter project**

```bash
cd /Users/prnice/Development/personal/c.v
flutter create portfolio --platforms=web --org=me.prnice
```

**Step 2: Replace pubspec.yaml**

Replace the full contents of `portfolio/pubspec.yaml`:

```yaml
name: portfolio
description: Prince Nna's portfolio site
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ^3.10.0

dependencies:
  flutter:
    sdk: flutter
  riverbloc: ^3.0.0
  flutter_riverpod: ^3.2.1
  equatable: ^2.0.8
  go_router: ^14.8.1
  flutter_animate: ^4.5.2
  google_fonts: ^6.2.1
  url_launcher: ^6.3.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
```

**Step 3: Install dependencies**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio
flutter pub get
```

**Step 4: Configure web/index.html**

Edit `portfolio/web/index.html`:
- Set `<title>` to `Prince Nna | Senior Full Stack Engineer`
- Add meta description: `Senior Full Stack Engineer specializing in Flutter, React, and cross-platform development`
- Set base href to `/`
- Add Open Graph meta tags (og:title, og:description, og:type=website)

**Step 5: Delete default test**

```bash
rm portfolio/test/widget_test.dart
```

**Step 6: Create directory structure**

```bash
cd portfolio/lib
mkdir -p app/view
mkdir -p core/{data,theme,widgets}
mkdir -p features/home/{view,widgets}
mkdir -p features/about/view
mkdir -p features/case_study/{models,view,widgets}
mkdir -p features/navigation/{models,view,widgets}
mkdir -p features/settings/{bloc,providers}
```

**Step 7: Verify it builds**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio
flutter build web
```

Expected: Build succeeds.

**Step 8: Commit**

```bash
git add portfolio/
git commit -m "chore: scaffold Flutter Web portfolio project with feature-first structure"
```

---

## Task 2: Theme System — Color Scheme & Typography

**Files:**
- Create: `portfolio/lib/core/theme/app_colors.dart`
- Create: `portfolio/lib/core/theme/app_typography.dart`
- Create: `portfolio/lib/core/theme/app_theme.dart`

**Step 1: Create color definitions**

Create `portfolio/lib/core/theme/app_colors.dart`:

```dart
import 'package:flutter/material.dart';

abstract final class AppColors {
  // Warm accent — inspired by Yaru's warmth
  static const accent = Color(0xFFE95420); // Ubuntu orange
  static const accentLight = Color(0xFFFF7043); // lighter variant

  // Dark mode surfaces
  static const darkSurface = Color(0xFF0F0F0F);
  static const darkSurfaceContainer = Color(0xFF1A1A1A);
  static const darkSurfaceContainerHigh = Color(0xFF242424);
  static const darkOnSurface = Color(0xFFF5F5F5);
  static const darkOnSurfaceVariant = Color(0xFFB0B0B0);

  // Light mode surfaces
  static const lightSurface = Color(0xFFFAFAFA);
  static const lightSurfaceContainer = Color(0xFFFFFFFF);
  static const lightSurfaceContainerHigh = Color(0xFFF0F0F0);
  static const lightOnSurface = Color(0xFF1A1A1A);
  static const lightOnSurfaceVariant = Color(0xFF666666);

  // Glass effect colors (dark mode cards)
  static const glassBackground = Color(0x08FFFFFF); // white at 3%
  static const glassBorder = Color(0x1AFFFFFF); // white at 10%
}
```

**Step 2: Create typography**

Create `portfolio/lib/core/theme/app_typography.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTypography {
  static TextTheme textTheme(Brightness brightness) {
    final color = brightness == Brightness.dark
        ? const Color(0xFFF5F5F5)
        : const Color(0xFF1A1A1A);

    return TextTheme(
      displayLarge: GoogleFonts.plusJakartaSans(
        fontSize: 56, fontWeight: FontWeight.w700, color: color, height: 1.1,
      ),
      displayMedium: GoogleFonts.plusJakartaSans(
        fontSize: 40, fontWeight: FontWeight.w700, color: color, height: 1.15,
      ),
      headlineLarge: GoogleFonts.plusJakartaSans(
        fontSize: 32, fontWeight: FontWeight.w600, color: color,
      ),
      headlineMedium: GoogleFonts.plusJakartaSans(
        fontSize: 24, fontWeight: FontWeight.w600, color: color,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 20, fontWeight: FontWeight.w600, color: color,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        fontSize: 16, fontWeight: FontWeight.w500, color: color,
      ),
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 16, fontWeight: FontWeight.w400, color: color, height: 1.6,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 14, fontWeight: FontWeight.w400, color: color, height: 1.5,
      ),
      labelLarge: GoogleFonts.plusJakartaSans(
        fontSize: 14, fontWeight: FontWeight.w500, color: color,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        fontSize: 13, fontWeight: FontWeight.w400, color: color,
      ),
    );
  }
}
```

**Step 3: Create theme data**

Create `portfolio/lib/core/theme/app_theme.dart`:

```dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.accentLight,
        surface: AppColors.lightSurface,
        surfaceContainer: AppColors.lightSurfaceContainer,
        surfaceContainerHigh: AppColors.lightSurfaceContainerHigh,
        onSurface: AppColors.lightOnSurface,
        onSurfaceVariant: AppColors.lightOnSurfaceVariant,
      ),
      textTheme: AppTypography.textTheme(Brightness.light),
      scaffoldBackgroundColor: AppColors.lightSurface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accentLight,
        surface: AppColors.darkSurface,
        surfaceContainer: AppColors.darkSurfaceContainer,
        surfaceContainerHigh: AppColors.darkSurfaceContainerHigh,
        onSurface: AppColors.darkOnSurface,
        onSurfaceVariant: AppColors.darkOnSurfaceVariant,
      ),
      textTheme: AppTypography.textTheme(Brightness.dark),
      scaffoldBackgroundColor: AppColors.darkSurface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}
```

**Step 4: Verify compilation**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio
flutter analyze
```

Expected: No issues found.

**Step 5: Commit**

```bash
git add portfolio/lib/core/theme/
git commit -m "feat: add Material 3 theme system with dark/light color schemes"
```

---

## Task 3: Settings Feature — Theme Bloc & Provider (RiverBloc)

**Files:**
- Create: `portfolio/lib/features/settings/bloc/theme_event.dart`
- Create: `portfolio/lib/features/settings/bloc/theme_state.dart`
- Create: `portfolio/lib/features/settings/bloc/theme_bloc.dart`
- Create: `portfolio/lib/features/settings/providers/theme_provider.dart`

**Step 1: Create theme event**

Create `portfolio/lib/features/settings/bloc/theme_event.dart`:

```dart
abstract class ThemeEvent {}

class ThemeToggled extends ThemeEvent {}
```

**Step 2: Create theme state**

Create `portfolio/lib/features/settings/bloc/theme_state.dart`:

```dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});

  final ThemeMode themeMode;

  factory ThemeState.initial() => const ThemeState(themeMode: ThemeMode.dark);

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  bool get isDark => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode];
}
```

**Step 3: Create theme bloc**

Create `portfolio/lib/features/settings/bloc/theme_bloc.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:riverbloc/riverbloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeToggled>(_onToggled);
  }

  void _onToggled(ThemeToggled event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      themeMode: state.isDark ? ThemeMode.light : ThemeMode.dark,
    ));
  }
}
```

**Step 4: Create theme provider**

Create `portfolio/lib/features/settings/providers/theme_provider.dart`:

```dart
import 'package:riverbloc/riverbloc.dart';

import '../bloc/theme_bloc.dart';
import '../bloc/theme_state.dart';

final themeBlocProvider = BlocProvider<ThemeBloc, ThemeState>(
  (ref) => ThemeBloc(),
);
```

**Step 5: Verify compilation**

```bash
flutter analyze
```

**Step 6: Commit**

```bash
git add portfolio/lib/features/settings/
git commit -m "feat: add ThemeBloc with RiverBloc for dark/light toggle"
```

---

## Task 4: App Widget & Main Entry Point

**Files:**
- Create: `portfolio/lib/app/app.dart`
- Create: `portfolio/lib/app/view/app.dart`
- Modify: `portfolio/lib/main.dart`

**Step 1: Create app view**

Create `portfolio/lib/app/view/app.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../features/navigation/models/app_routes.dart';
import '../../features/settings/providers/theme_provider.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeBlocProvider);

    return MaterialApp.router(
      title: 'Prince Nna | Senior Full Stack Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeState.themeMode,
      routerConfig: AppRoutes.router,
    );
  }
}
```

**Step 2: Create barrel export**

Create `portfolio/lib/app/app.dart`:

```dart
export 'view/app.dart';
```

**Step 3: Update main.dart**

Replace `portfolio/lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: PortfolioApp()));
}
```

**Step 4: Create placeholder route config**

Create `portfolio/lib/features/navigation/models/app_routes.dart` (placeholder — full implementation in Task 6):

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Home')),
        ),
      ),
    ],
  );
}
```

**Step 5: Verify it builds and runs**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio
flutter build web
```

Expected: Build succeeds. App shows "Home" text.

**Step 6: Commit**

```bash
git add portfolio/lib/
git commit -m "feat: add PortfolioApp with ProviderScope and RiverBloc theme"
```

---

## Task 5: Content Data Layer

**Files:**
- Create: `portfolio/lib/features/case_study/models/case_study.dart`
- Create: `portfolio/lib/core/data/case_studies.dart`
- Create: `portfolio/lib/core/data/skills.dart`
- Create: `portfolio/lib/core/data/social_links.dart`

**Step 1: Create case study model**

Create `portfolio/lib/features/case_study/models/case_study.dart`:

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

**Step 2: Create case study data**

Create `portfolio/lib/core/data/case_studies.dart` with all 7 case studies. Content source: `docs/plans/2026-03-15-portfolio-site-design.md` "Case Studies" section + `career_context_v2.md` + Confluence docs.

Each case study needs: slug, title, subtitle, summary, tags, 4-5 CaseStudySections (Challenge, Approach, Architecture/Features, Impact), optional repoUrl/dateRange/role. Set `gridSpan: 2` for "Search Architecture" and "Skyewallet" (featured cards).

This file will be ~350 lines. Populate every field — do not leave placeholders.

**Step 3: Create skills data**

Create `portfolio/lib/core/data/skills.dart`:

```dart
class SkillCategory {
  const SkillCategory({required this.name, required this.skills});
  final String name;
  final List<String> skills;
}

const skillCategories = [
  SkillCategory(name: 'Languages', skills: ['Dart', 'TypeScript', 'JavaScript', 'HTML/CSS', 'Nix']),
  SkillCategory(name: 'Frameworks', skills: ['Flutter', 'React', 'Next.js', 'NestJS', 'Handlebars']),
  SkillCategory(name: 'State & Data', skills: ['Bloc', 'Riverpod', 'Zustand', 'React Query', 'GraphQL', 'Redux']),
  SkillCategory(name: 'Infrastructure', skills: ['NixOS', 'Nix Flakes', 'Docker', 'GitHub Actions', 'Codemagic']),
  SkillCategory(name: 'Testing', skills: ['Unit/Widget Testing', 'Cypress', 'Playwright']),
  SkillCategory(name: 'Tooling', skills: ['Mason', 'Melos', 'Datadog', 'Google Analytics (GA4)']),
];
```

**Step 4: Create social links data**

Create `portfolio/lib/core/data/social_links.dart`:

```dart
import 'package:flutter/material.dart';

class SocialLink {
  const SocialLink({required this.label, required this.url, required this.icon});
  final String label;
  final String url;
  final IconData icon;
}

const socialLinks = [
  SocialLink(label: 'GitHub', url: 'https://github.com/Prn-Ice', icon: Icons.code),
  SocialLink(label: 'LinkedIn', url: 'https://linkedin.com/in/princenna', icon: Icons.person),
  SocialLink(label: 'Email', url: 'mailto:stormprince77@gmail.com', icon: Icons.email),
];
```

**Step 5: Verify compilation**

```bash
flutter analyze
```

**Step 6: Commit**

```bash
git add portfolio/lib/
git commit -m "feat: add content data layer with case studies, skills, and social links"
```

---

## Task 6: Navigation Feature — Router, App Shell, Nav Bar, Footer

**Files:**
- Modify: `portfolio/lib/features/navigation/models/app_routes.dart`
- Create: `portfolio/lib/features/navigation/view/app_shell.dart`
- Create: `portfolio/lib/features/navigation/widgets/nav_bar.dart`
- Create: `portfolio/lib/features/navigation/widgets/footer.dart`
- Create: `portfolio/lib/features/home/view/home_page.dart` (placeholder)
- Create: `portfolio/lib/features/about/view/about_page.dart` (placeholder)
- Create: `portfolio/lib/features/case_study/view/case_study_page.dart` (placeholder)

**Step 1: Create placeholder pages**

Create `portfolio/lib/features/home/view/home_page.dart`:

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home'));
  }
}
```

Create `portfolio/lib/features/about/view/about_page.dart`:

```dart
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('About'));
  }
}
```

Create `portfolio/lib/features/case_study/view/case_study_page.dart`:

```dart
import 'package:flutter/material.dart';

class CaseStudyPage extends StatelessWidget {
  const CaseStudyPage({super.key, required this.slug});
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Case Study: $slug'));
  }
}
```

**Step 2: Create nav bar**

Create `portfolio/lib/features/navigation/widgets/nav_bar.dart`:

Responsive nav bar:
- Logo/name on left (clickable → `/`). Use `bodyLarge` weight 600 for name.
- Desktop: inline links (Home, About) + ThemeToggle on right
- Mobile (<600px): hamburger icon → end drawer with links
- Max content width: 1200px centered
- Use `Consumer` to read `themeBlocProvider` for toggle
- Height: 64px
- Transparent background, bottom border in light mode (1px gray)

**Step 3: Create theme toggle widget**

Create `portfolio/lib/features/navigation/widgets/theme_toggle.dart`:

```dart
import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key, required this.isDark, required this.onToggle});

  final bool isDark;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          key: ValueKey(isDark),
        ),
      ),
      onPressed: onToggle,
      tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
    );
  }
}
```

**Step 4: Create footer**

Create `portfolio/lib/features/navigation/widgets/footer.dart`:

Simple footer:
- Row: "Built with Flutter" on left, social icon buttons on right
- Max content width: 1200px
- Top border (1px), vertical padding 24px
- Muted text color (`onSurfaceVariant`)

**Step 5: Create app shell**

Create `portfolio/lib/features/navigation/view/app_shell.dart`:

```dart
import 'package:flutter/material.dart';

import '../widgets/nav_bar.dart';
import '../widgets/footer.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(child: child),
          const Footer(),
        ],
      ),
    );
  }
}
```

**Step 6: Update router with ShellRoute**

Replace `portfolio/lib/features/navigation/models/app_routes.dart`:

```dart
import 'package:go_router/go_router.dart';

import '../../home/view/home_page.dart';
import '../../about/view/about_page.dart';
import '../../case_study/view/case_study_page.dart';
import '../view/app_shell.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const caseStudy = '/case-study/:slug';

  static String caseStudyPath(String slug) => '/case-study/$slug';

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: about,
            builder: (context, state) => const AboutPage(),
          ),
          GoRoute(
            path: caseStudy,
            builder: (context, state) {
              final slug = state.pathParameters['slug']!;
              return CaseStudyPage(slug: slug);
            },
          ),
        ],
      ),
    ],
  );
}
```

**Step 7: Verify it builds and navigates**

```bash
flutter build web
```

**Step 8: Commit**

```bash
git add portfolio/lib/
git commit -m "feat: add navigation feature with app shell, nav bar, footer, and go_router"
```

---

## Task 7: Core Shared Widgets

**Files:**
- Create: `portfolio/lib/core/widgets/glass_card.dart`
- Create: `portfolio/lib/core/widgets/tech_tag.dart`
- Create: `portfolio/lib/core/widgets/section_container.dart`

**Step 1: Create glass card**

Create `portfolio/lib/core/widgets/glass_card.dart`:

A card that adapts to the current theme:
- Dark mode: `AppColors.glassBackground` fill, `AppColors.glassBorder` border, backdrop blur if supported
- Light mode: white surface, subtle box shadow (0,2,8 at 5% black), light gray border
- Rounded corners: 20px
- Padding: configurable (default 24px)
- Hover effect: subtle scale (1.02) with `AnimatedScale`
- onTap callback
- child widget

**Step 2: Create tech tag**

Create `portfolio/lib/core/widgets/tech_tag.dart`:

```dart
import 'package:flutter/material.dart';

class TechTag extends StatelessWidget {
  const TechTag({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
```

**Step 3: Create section container**

Create `portfolio/lib/core/widgets/section_container.dart`:

A centered, max-width container for page sections:
- Max width: 1200px (configurable)
- Horizontal padding: 24px mobile, 48px desktop
- Centers content

```dart
import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.maxWidth = 1200,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}
```

**Step 4: Verify compilation**

```bash
flutter analyze
```

**Step 5: Commit**

```bash
git add portfolio/lib/core/widgets/
git commit -m "feat: add shared widgets (glass_card, tech_tag, section_container)"
```

---

## Task 8: Home Feature — Hero Section

**Files:**
- Modify: `portfolio/lib/features/home/view/home_page.dart`
- Create: `portfolio/lib/features/home/widgets/hero_section.dart`

**Step 1: Create hero section**

Create `portfolio/lib/features/home/widgets/hero_section.dart`:

Full-width hero:
- Name: "Prince Nna" in `displayLarge`
- Title: "Senior Full Stack Engineer" in `headlineMedium` with `colorScheme.primary`
- Summary from resume: "Senior Full Stack Engineer with 6+ years of production experience and a proven track record of cross-platform delivery, independently owning and evolving complex search architectures across Flutter, React, and Handlebars CMS ecosystems."
- Max width for summary text: 700px
- CTA row: "View Resume" (filled button, accent), "GitHub" (outlined), "LinkedIn" (outlined)
  - Use `url_launcher` to open links
- Vertical padding: 120px top, 80px bottom
- Wrapped in `SectionContainer`
- Responsive: on mobile (<600px) use `displayMedium` for name, stack CTAs vertically

**Step 2: Update home page**

Replace `portfolio/lib/features/home/view/home_page.dart`:

```dart
import 'package:flutter/material.dart';

import '../widgets/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
        ],
      ),
    );
  }
}
```

**Step 3: Verify visually**

```bash
flutter run -d chrome
```

Check: hero renders at desktop and mobile widths, CTAs open correct URLs.

**Step 4: Commit**

```bash
git add portfolio/lib/features/home/
git commit -m "feat: add hero section to home page"
```

---

## Task 9: Home Feature — Bento Grid

**Files:**
- Create: `portfolio/lib/features/home/widgets/case_study_card.dart`
- Create: `portfolio/lib/features/home/widgets/bento_grid.dart`
- Modify: `portfolio/lib/features/home/view/home_page.dart`

**Step 1: Create case study card**

Create `portfolio/lib/features/home/widgets/case_study_card.dart`:

Uses `GlassCard` from core:
- Title in `titleLarge`
- Subtitle in `bodyMedium` with muted color
- 1-line summary in `bodyMedium`, max 2 lines with ellipsis
- Row of `TechTag` chips (first 3-4 tags only to avoid overflow)
- onTap: `context.go(AppRoutes.caseStudyPath(caseStudy.slug))`
- Minimum height: 200px

**Step 2: Create bento grid**

Create `portfolio/lib/features/home/widgets/bento_grid.dart`:

Responsive grid using `LayoutBuilder`:
- Desktop (>1024px): 3 columns, 16px gap. Cards with `gridSpan: 2` span 2 columns.
- Tablet (600-1024px): 2 columns, 16px gap
- Mobile (<600px): 1 column, 12px gap

Implementation approach: Use `Wrap` with calculated card widths based on available width and column count. For `gridSpan: 2` cards, set width to span 2 column slots. Wrap inside `SectionContainer`.

Section heading: "Projects" in `headlineLarge` with 80px top padding, 32px bottom padding.

**Step 3: Add to home page**

Add `BentoGrid()` to home page Column after `HeroSection()`.

**Step 4: Verify visually**

```bash
flutter run -d chrome
```

Check: grid renders, cards clickable, responsive breakpoints correct, wide cards span properly.

**Step 5: Commit**

```bash
git add portfolio/lib/features/home/
git commit -m "feat: add bento grid with case study cards to home page"
```

---

## Task 10: Home Feature — Skills Section

**Files:**
- Create: `portfolio/lib/features/home/widgets/skills_section.dart`
- Modify: `portfolio/lib/features/home/view/home_page.dart`

**Step 1: Create skills section**

Create `portfolio/lib/features/home/widgets/skills_section.dart`:

- Section heading: "Skills" in `headlineLarge`, 80px top padding, 32px bottom
- Responsive grid of `GlassCard` widgets (2 columns tablet+, 1 column mobile)
- Each card: category name in `titleLarge`, skills as `Wrap` of `TechTag` chips
- 16px gap between cards
- Wrapped in `SectionContainer`
- 80px bottom padding after section

**Step 2: Add to home page**

Add `SkillsSection()` to home page Column after `BentoGrid()`.

**Step 3: Verify visually**

```bash
flutter run -d chrome
```

**Step 4: Commit**

```bash
git add portfolio/lib/features/home/
git commit -m "feat: add skills section to home page"
```

---

## Task 11: About Feature

**Files:**
- Modify: `portfolio/lib/features/about/view/about_page.dart`

**Step 1: Implement about page**

Replace placeholder with full about page using `SingleChildScrollView` + `SectionContainer`:

- Header: "About" in `displayMedium`, 80px top padding
- Bio: 2-3 paragraphs in `bodyLarge`, max-width 800px. Content from resume summary + career context "AI-Assisted World" section. Cover: cross-platform expertise, documentation leadership, AI-predictable architecture philosophy.
- Interests section: heading "Beyond Code" in `headlineLarge`. Grid of `GlassCard` items for: Linux & NixOS, Open Source, Fintech/Crypto, Hardware Tinkering. Each with icon + short description.
- Contact section: heading "Get In Touch" in `headlineLarge`. Social links as large `GlassCard` buttons with icon + label + URL. Include "Download Resume" card linking to resume PDF.
- 80px bottom padding

**Step 2: Verify visually**

```bash
flutter run -d chrome
```

Navigate to `/about`.

**Step 3: Commit**

```bash
git add portfolio/lib/features/about/
git commit -m "feat: implement about page with bio, interests, and contact"
```

---

## Task 12: Case Study Feature — Detail Page

**Files:**
- Create: `portfolio/lib/features/case_study/widgets/case_study_hero.dart`
- Create: `portfolio/lib/features/case_study/widgets/case_study_section_widget.dart`
- Modify: `portfolio/lib/features/case_study/view/case_study_page.dart`

**Step 1: Create case study hero widget**

Create `portfolio/lib/features/case_study/widgets/case_study_hero.dart`:

- Back button (TextButton with arrow icon) → `context.go('/')`
- Title in `displayMedium`
- Subtitle/role in `titleLarge` with `onSurfaceVariant` color
- Date range if present in `bodyMedium`
- Row of `TechTag` chips
- 80px vertical padding
- Wrapped in `SectionContainer` with maxWidth 800

**Step 2: Create case study section widget**

Create `portfolio/lib/features/case_study/widgets/case_study_section_widget.dart`:

- Section title in `headlineMedium`
- Body text in `bodyLarge`
- If `bulletPoints` is not null, render as a Column of rows with accent dot + text
- 48px spacing between sections
- Max width: 800px (via parent SectionContainer)

**Step 3: Implement case study page**

Update `portfolio/lib/features/case_study/view/case_study_page.dart`:

- Look up case study by `slug` from `caseStudies` list in `core/data/case_studies.dart`
- If not found: centered "Project not found" + "Back to Home" button
- If found: `SingleChildScrollView` → Column:
  - `CaseStudyHero(caseStudy)`
  - For each section: `CaseStudySectionWidget(section)`
  - If `repoUrl` != null: "View on GitHub" button
  - "Back to Projects" text button at bottom
  - 80px bottom padding
- All wrapped in `SectionContainer(maxWidth: 800)`

**Step 4: Verify visually**

```bash
flutter run -d chrome
```

Navigate to `/case-study/search-architecture`, check all sections render. Test `/case-study/nonexistent` for 404.

**Step 5: Commit**

```bash
git add portfolio/lib/features/case_study/
git commit -m "feat: implement case study detail page with hero and section widgets"
```

---

## Task 13: Scroll Animations

**Files:**
- Modify: `portfolio/lib/features/home/widgets/hero_section.dart`
- Modify: `portfolio/lib/features/home/widgets/bento_grid.dart`
- Modify: `portfolio/lib/features/home/widgets/skills_section.dart`
- Modify: `portfolio/lib/features/case_study/widgets/case_study_section_widget.dart`

**Step 1: Add entrance animations to hero**

In `hero_section.dart`, add `import 'package:flutter_animate/flutter_animate.dart';` and wrap elements:

```dart
// Name fades in and slides up
Text("Prince Nna")
  .animate()
  .fadeIn(duration: 600.ms, curve: Curves.easeOut)
  .slideY(begin: 0.3, end: 0, duration: 600.ms),

// Title animates after name
Text("Senior Full Stack Engineer")
  .animate(delay: 200.ms)
  .fadeIn(duration: 600.ms)
  .slideY(begin: 0.3, end: 0, duration: 600.ms),

// CTAs stagger in
ctaRow.animate(delay: 600.ms).fadeIn(duration: 400.ms),
```

**Step 2: Add staggered animations to bento grid**

Animate the list of cards using the `.animate()` list extension:

```dart
cards.animate(interval: 100.ms)
  .fadeIn(duration: 400.ms, curve: Curves.easeOut)
  .slideY(begin: 0.15, end: 0, duration: 400.ms)
```

**Step 3: Add staggered animations to skills section**

Same pattern as bento grid for skill category cards.

**Step 4: Add animations to case study sections**

Each `CaseStudySectionWidget` fades in with a staggered delay:

```dart
sectionWidget.animate(delay: (index * 100).ms)
  .fadeIn(duration: 400.ms)
  .slideY(begin: 0.1, end: 0, duration: 400.ms)
```

**Step 5: Verify animations**

```bash
flutter run -d chrome
```

Check: smooth animations on page load, no jank. Test on case study pages too.

**Step 6: Commit**

```bash
git add portfolio/lib/
git commit -m "feat: add scroll-triggered animations with flutter_animate"
```

---

## Task 14: Polish & Responsive Refinement

**Files:**
- Various widget files for spacing/layout adjustments

**Step 1: Test all breakpoints**

Open Chrome DevTools, test at: 375px (iPhone SE), 768px (iPad), 1280px (laptop), 1920px (desktop).

**Step 2: Fix spacing issues**

Common issues:
- Hero text too large on mobile → reduce to `displaySmall` or `headlineLarge`
- Bento grid gaps too wide on mobile → reduce to 12px
- Footer overflow on small screens → wrap or stack
- Nav bar items overflow on tablet → adjust breakpoint

**Step 3: Verify theme toggle in both modes**

- Dark: glass cards visible, text readable, accent pops
- Light: white cards with shadow, clean contrast, no invisible text

**Step 4: Test all navigation paths**

- Home → click card → Case Study → Back button → Home
- Home → About → Home (via nav)
- Direct URL: `/case-study/search-architecture` → renders correctly
- Direct URL: `/case-study/nonexistent` → shows 404

**Step 5: Commit**

```bash
git add portfolio/lib/
git commit -m "fix: responsive layout refinements and theme polish"
```

---

## Task 15: GitHub Actions Deployment

**Files:**
- Create: `.github/workflows/deploy.yml`

**Step 1: Create deployment workflow**

Create `.github/workflows/deploy.yml`:

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

      - name: Install dependencies
        working-directory: portfolio
        run: flutter pub get

      - name: Build web
        working-directory: portfolio
        run: flutter build web --release --base-href /

      - name: Copy CNAME
        run: cp CNAME portfolio/build/web/CNAME

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

**Step 2: Verify base href in web/index.html**

Ensure `<base href="/">` is set in `portfolio/web/index.html`.

**Step 3: Commit**

```bash
git add .github/
git commit -m "ci: add GitHub Actions workflow for Flutter Web deployment to Pages"
```

---

## Task 16: Final Build Verification & Cleanup

**Step 1: Full production build**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio
flutter build web --release
```

Expected: Build succeeds.

**Step 2: Serve locally and test**

```bash
cd /Users/prnice/Development/personal/c.v/portfolio/build/web
python3 -m http.server 8080
```

Open `http://localhost:8080`. Verify: all pages, theme toggle, case studies, responsive, no console errors.

**Step 3: Archive old HTML files**

```bash
cd /Users/prnice/Development/personal/c.v
mkdir -p archive
mv index.html archive/index_old_dark.html
mv index_light.html archive/index_old_light.html
```

**Step 4: Final commit**

```bash
git add .
git commit -m "feat: complete portfolio site, archive old HTML"
```

---

## Task Summary

| Task | Description | Feature |
|------|-------------|---------|
| 1 | Scaffold Flutter project with directory structure | setup |
| 2 | Theme system (colors, typography, ThemeData) | core/theme |
| 3 | ThemeBloc with RiverBloc | features/settings |
| 4 | App widget with ProviderScope + MaterialApp.router | app |
| 5 | Content data (case studies, skills, social links) | core/data + case_study/models |
| 6 | Router, app shell, nav bar, footer | features/navigation |
| 7 | Shared widgets (glass_card, tech_tag, section_container) | core/widgets |
| 8 | Home hero section | features/home |
| 9 | Bento grid with case study cards | features/home |
| 10 | Skills section | features/home |
| 11 | About page | features/about |
| 12 | Case study detail page | features/case_study |
| 13 | Scroll animations | features/* |
| 14 | Responsive polish | features/* |
| 15 | GitHub Actions deployment | .github |
| 16 | Final verification & cleanup | — |
