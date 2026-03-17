# Portfolio Site Design

## Overview

Flutter Web SPA replacing the current Typora-exported static HTML at `portfolio.prnice.me`. Material 3 with aggressive customization targeting Google Store / Pixel aesthetic. Dark/light theme toggle. Deployed to GitHub Pages.

## Reference

Rob Dahl's site (robdahl.dev): dark-first glassmorphic design, bento grid project cards, case study detail pages, hero with photo/title/links, skills grid, no light mode. We adapt this structure with Material 3, add light mode, and tailor content to Prince's strengths.

## Pages & Routes

| Route | Page | Content |
|-------|------|---------|
| `/` | Home | Hero (name, title, summary, action buttons) + bento grid of case studies + skills snapshot |
| `/about` | About | Professional bio, photo, interests, contact links |
| `/case-study/:slug` | Case Study | Individual project deep-dive |

## Case Studies (7)

### 1. Search Architecture
**Slug**: `search-architecture`
**Tags**: Flutter, Bloc, Google Maps, Cross-Platform
**Summary**: Owned end-to-end search across Consumer (Flutter), Command (React), and CMS (Handlebars). Refactored 1400+ LOC monolithic widgets into decomposed Bloc architecture.
**Sections**:
- Challenge: Monolithic MapView/SearchMapView (1400+ lines each), prop drilling, untestable logic, business logic mixed with UI
- Approach: Decomposed into MapView → SearchMapView → SearchMapBloc → DrawingContainer → HoverContainer. Moved all logic to Bloc, UI became reactive listeners
- Architecture: Component diagram (MapView, SearchMapBloc, SearchMapListener, DrawingContainer, HoverContainer). FilterScope enum driving 4 platform surfaces (consumer/command/cms/luxurySite) with different business logic per scope
- Features: Autocomplete with grouped results, boundary/multi-boundary/draw-to-search, agent search with location filtering, filter system (Price, Living Area, Lot Size, Year Built)
- Impact: Team's Flutter reference after VGV departure, 25x test speed improvement (75s → 3s)

### 2. Search 2.0 / Command Platform
**Slug**: `search-2-command`
**Tags**: React, TypeScript, Zustand, GraphQL
**Summary**: Brought feature parity to agent-facing Command platform. Migrated Redux → Zustand + React Query. Built Compare Map with geocoded pin placement.
**Sections**:
- Challenge: Agent-facing platform lacked consumer search capabilities, complex Redux setup
- Approach: Migrated to Zustand + React Query, migrated REST → GraphQL, wrote extensive integration tests
- Features: Property card interactions (checkboxes, shift-click range), Compare Map (subject overlays, custom pins, geocoded addresses), ULS endpoint migration
- Impact: Feature parity across consumer and agent experiences

### 3. Analytics & Observability
**Slug**: `analytics-observability`
**Tags**: GA4, Datadog, Documentation, Team Enablement
**Summary**: Drove analytics coverage and created team-wide documentation. Authored 7 Confluence pages including GA4 tutorials with 6 video walkthroughs.
**Sections**:
- Challenge: Team lacked analytics literacy and debugging workflows
- Approach: Created comprehensive GA4 guide with video tutorials, wrote debugging guides for Web and Android
- Documentation: GA4 Reports page (6 videos), GA Debugging guide, Search Map architecture doc, FilterScope usages, Proposed Best Practices
- Impact: 36 Confluence contributions, established team-wide knowledge standards, Flutter SME after VGV departure

### 4. Skyewallet
**Slug**: `skyewallet`
**Tags**: Flutter, Crypto, mTLS, Production
**Summary**: Production crypto wallet with buy/sell/swap, P2P marketplace, virtual debit cards, KYC verification. Published on App Store and Play Store.
**Sections**:
- Challenge: Full-feature crypto platform with regulatory requirements (KYC), security needs (mTLS), multi-country P2P transfers
- Features: Crypto buy/sell/swap/send/receive, P2P marketplace, virtual debit cards, bill payments (airtime, cable, electricity), Smile ID KYC
- Tech: GetX, Dio/Retrofit, Firebase suite, flutter_secure_storage, local_auth, mTLS certificates
- Impact: 90+ production builds, v2.15.3, 807 lib files, published on both stores

### 5. Flutter Architecture & Tooling
**Slug**: `flutter-architecture-tooling`
**Tags**: Mason, Architecture, DI, Monorepo, Published
**Summary**: Codified opinionated Flutter architecture (heavy_app) with auto_route, injectable DI, 3 build flavors, melos monorepo. Plus 7 additional Mason templates on brickhub.dev.
**Sections**:
- Challenge: Every new Flutter project starts with the same boilerplate decisions — routing, DI, state management, CI, linting
- Approach: Codified architectural opinions into Mason brick templates. heavy_app generates a complete project with auto_route, injectable/get_it, 3 flavors (dev/staging/prod), melos monorepo, custom packages (app_ui, bloc_logger, auto_route_observer), i18n, pre-commit hooks, FVM
- Ecosystem: 8 bricks total — heavy_app, heavy_repository_package, heavy_service_package, cloud_messaging_service_package, model_test, annoying_analysis_options, brick_starter
- Impact: 7 stars on GitHub, published on brickhub.dev, defines "how apps should be built" not just building apps

### 6. LenovoLegionLinuxFrontend
**Slug**: `lenovo-legion-linux-frontend`
**Tags**: Flutter, Linux, Desktop, Hardware
**Summary**: Flutter desktop frontend for Lenovo Legion Linux fan control and power management tools.
**Sections**:
- Challenge: LenovoLegionLinux provided CLI-only fan control and power management for Legion laptops on Linux — no GUI
- Approach: Built a Flutter desktop application providing visual controls for fan curves, power profiles, and thermal management
- Tech: Flutter desktop (Linux), system-level integration
- Impact: Demonstrates Flutter beyond mobile/web — desktop systems tooling

### 7. NixOS & Infrastructure
**Slug**: `nixos-infrastructure`
**Tags**: NixOS, Nix Flakes, Hardware, OpenRGB
**Summary**: Personal NixOS configuration with Flakes + Home-Manager, custom hardware support (Legion Slim 7), managed Android dev environments. OpenRGB hardware contribution.
**Sections**:
- Challenge: Reproducible development environments across machines, hardware support for newer Lenovo Legion laptops on Linux
- Approach: Declarative system configuration with Nix Flakes, Home-Manager for user-level config, custom hardware modules
- Contributions: OpenRGB Legion 7s Gen8 hardware support (merged upstream), Legion-Slim-7-16APH8 documentation, reusable Nix development flakes
- Impact: Shows systems thinking — infrastructure as code applied to personal development environment

## Visual Design

### Color System
- **Warm neutral palette** inspired by Yaru's warmth
- Single accent color (warm orange or teal — to be determined during implementation)
- Dark mode: near-black surfaces with glassmorphic card overlays (white at 2-5% opacity, subtle borders)
- Light mode: crisp white backgrounds, subtle gray card borders, gentle shadows for depth

### Typography
- Display font: Plus Jakarta Sans or Inter (Google Fonts) — clean, modern, not Roboto
- Body: Same family at regular weight
- Monospace: JetBrains Mono for code snippets in case studies
- Type scale: Display (48-64px hero) → H1 (32-40px) → H2 (24-28px) → Body (16px) → Caption (14px)

### Layout
- **Home hero**: Full-width, name + title + 2-3 sentence summary + CTA buttons (Resume PDF, GitHub, LinkedIn)
- **Bento grid**: Variable-size cards (2-3 columns desktop, 1 column mobile). Larger cards for Search Architecture and Skyewallet. Each card: title, category subtitle, 1-line description, tech tags
- **Section padding**: 80-120px vertical rhythm
- **Max content width**: 1200px centered

### Cards
- Rounded corners: 16-24px border radius
- Dark mode: glassmorphic (semi-transparent bg, subtle white border, backdrop blur)
- Light mode: white surface, subtle border or shadow
- Hover: subtle scale or elevation change

### Motion
- Scroll-triggered fade-in/slide-up for sections (flutter_animate)
- Smooth page transitions via go_router
- Theme toggle animation (smooth color interpolation)

### Responsive Breakpoints
- Mobile: < 600px — single column, stacked hero
- Tablet: 600-1024px — 2 column grid
- Desktop: > 1024px — 3 column bento grid, side-by-side layouts

## Theme Toggle
- Toggle button in app bar (sun/moon icon)
- Uses Flutter's `ThemeMode` with custom `ColorScheme` for both modes
- Persists preference (SharedPreferences or equivalent)
- Smooth animated transition between themes

## Case Study Page Layout
Consistent template for all 7 case studies:
1. **Hero**: Project title, role badge, date range, tech tag pills
2. **Overview**: 2-3 sentence summary
3. **Challenge**: What problem existed
4. **Approach**: How it was solved (architecture decisions, trade-offs)
5. **Architecture/Features**: Diagrams, component breakdowns, or feature lists
6. **Impact**: Measurable outcomes, metrics, team effects
7. **Links**: GitHub repo, live project, related docs (where applicable)

## Tech Stack
- Flutter Web (stable channel)
- `go_router` — declarative routing with URL support
- `flutter_animate` — scroll-triggered animations
- `url_launcher` — external links
- `google_fonts` — typography (Plus Jakarta Sans + JetBrains Mono)
- GitHub Actions — build `flutter build web` and deploy to Pages

## Deployment
- GitHub Actions workflow: on push to main, run `flutter build web`, copy `build/web/` contents to deploy branch or root
- CNAME file preserved for `portfolio.prnice.me`
- Old index.html / index_light.html archived or removed

## Content Source
- Resume content from `resume_v2_ats_optimized.md`
- Career context from `career_context_v2.md`
- Case study details from Confluence docs (Search Map, FilterScope) + career context themes
- About page: bio derived from resume summary + interests (Linux/NixOS, open source, crypto/fintech)
