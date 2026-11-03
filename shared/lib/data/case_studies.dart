import '../models/case_study.dart';

const caseStudies = [
  // -- Expert Listing (featured, current employment) --
  CaseStudy(
    slug: 'expert-listing',
    title: 'Expert Listing',
    subtitle: 'A Shared Dart Core for Mobile and Web',
    summary:
        'Lead mobile development and rebuilt the Flutter app and Dart/Jaspr '
        'website around shared API and application-state packages. Took the '
        'mobile rebuild from its first commit to a store release in 24 days, '
        'while helping hire and establish the engineering team.',
    tags: ['Flutter', 'Jaspr', 'Riverpod', 'Django REST', 'Team Leadership'],
    dateRange: 'Sep 2026 – Present',
    role: 'Mobile Developer @ Expert Listing',
    gridSpan: 2,
    links: [
      CaseStudyLink(
        label: 'Dart web rewrite',
        url:
            'https://ex-c4a7774adafe48d88f9a8764de7c677b.ecs.us-east-1.on.aws/',
      ),
      CaseStudyLink(
        label: 'Google Play',
        url:
            'https://play.google.com/store/apps/details?id=ng.expertlisting.expertlisting&hl=en',
      ),
      CaseStudyLink(
        label: 'App Store',
        url: 'https://apps.apple.com/us/app/expert-listing/id6766226080',
      ),
    ],
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Rebuild the mobile experience against an existing Django REST '
            'backend and bring the website into the same Dart ecosystem, '
            'without duplicating API contracts and product behaviour across '
            'two clients. Public property pages also needed crawlable HTML '
            'and search metadata, not just a client-rendered interface.',
      ),
      CaseStudySection(
        title: 'Architecture',
        content:
            'Kept API models, repositories, and Riverpod providers in pure-Dart '
            'packages consumed by Flutter and Jaspr. Each host supplies its '
            'own networking, authentication storage, and media capabilities. '
            'The website renders public pages on the server and hydrates '
            'interactive islands; browser sessions use HttpOnly cookies.',
        bulletPoints: [
          'Property search, listing detail, profiles, and account workflows',
          'Feed, stories, video preparation, messaging, and notification '
              'work behind backend feature flags',
          'Server-rendered first reads with shared state for browser hydration',
          'SEO comparison tooling for metadata, structured data, and links '
              'during the website migration',
        ],
      ),
      CaseStudySection(
        title: 'Team & Delivery',
        content:
            'Lead the mobile development team and worked with the business '
            'to interview and hire an additional mobile developer and a '
            'backend developer. Established developer documentation, Beads '
            'tracking, repository rules, and release workflows, with Patrol '
            'mobile journeys and Playwright web journeys.',
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'The mobile repository started on 11 September 2026 and v2.0 '
            'reached the stores on 5 October: 24 days from the first commit. '
            'Continued improving media, slow-network behaviour, shared '
            'state, and deployment review. Also contributed Django API '
            'fixes and admin improvements alongside the client rebuilds; '
            'feature availability remains controlled by each backend environment.',
      ),
    ],
  ),

  // -- findaphone.ng (featured, independent product) --
  CaseStudy(
    slug: 'findaphone',
    title: 'findaphone.ng',
    subtitle: 'A Phone-Buying Platform for Nigeria',
    summary:
        'Founded and built a live phone-buying platform for Nigeria, from '
        'recommendations and marketplace matching to reviewed community OS '
        'support and NCC model-approval evidence. One Dart monorepo spans '
        'the Jaspr website, dart_frog API, scrapers, and Supabase Postgres.',
    tags: ['Dart', 'Jaspr', 'dart_frog', 'Supabase', 'Melos', 'Founder'],
    dateRange: 'Apr 2026 – Present',
    role: 'Library Curator @ findaphone.ng',
    liveUrl: 'https://findaphone.ng',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Nigerians buying phones face opaque pricing, inconsistent specs, '
            'and outright scams across fragmented marketplaces. There was no '
            'trustworthy way to match a budget and a set of priorities to the '
            'right phone, or to tell a fair listing from a fake one.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Built everything in one Dart monorepo (Melos) so typed models and '
            'pure business logic travel cleanly across tiers: a Jaspr static '
            'site with @client interactive islands, a dart_frog REST API that '
            'loads the whole catalogue into memory at boot, a pure-Dart '
            'scraper, and Supabase Postgres with row-level security.',
      ),
      CaseStudySection(
        title: 'Curation Engine',
        content:
            'As Library Curator, I vet every phone and listing that enters the '
            'canonical catalogue:',
        bulletPoints: [
          'Confidence-scored matcher (Jaccard similarity, brand multiplier, '
              'exact-model boost) tiers listings into auto-approve, review, '
              'and catalogue-gap buckets',
          'Admin review workflow protects already-reviewed rows from '
              're-scrape clobbering',
          'Four idempotent enrichment pipelines (spec sheets, benchmark '
              'scores, review data, image rehosting), each writing its own '
              'column family',
          'Two-signal price-sanity filter catches listing scams, including a '
              'real mismatched-device listing in production',
        ],
      ),
      CaseStudySection(
        title: 'Evidence-Led Discovery',
        content:
            'Extended the catalogue beyond specifications and prices with '
            'reviewed community OS support and an NCC registry browser. '
            'Official-source adapters produce candidates for human review, '
            'not automatic approval. Exact model variants, support status, '
            'and source evidence remain attached to published records.',
        bulletPoints: [
          'Community OS discovery published with reviewed support records '
              'across 566 phone families',
          'NCC registry browsing distinguishes exact model Type Approval '
              'from verification of an individual device',
          'Immutable Supabase evidence snapshots and repeatable publication '
              'tools preserve review decisions and provenance',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Live in production on Cloudflare Pages, Railway, and Supabase with '
            'continuous deployment. Shared pure-Dart recommendation logic '
            'supports budget and preference-led discovery, guarded by unit, '
            'integration, schema-contract, and end-to-end tests. Recent work '
            'also covers server-component boundaries, session continuity, '
            'search indexability, and data-backed sitemap metadata.',
      ),
    ],
  ),

  // -- Lagos Landlord (Expert Listing game experiment) --
  CaseStudy(
    slug: 'lagos-landlord',
    title: 'Lagos Landlord',
    subtitle: 'A Playable Lagos in the Browser',
    summary:
        'Built a browser-based Lagos game experiment with walkable streets, '
        'keke driving, interactive characters, and multiplayer presence. '
        'Kept the Three.js world separate from its React interface and '
        'server-owned game economy.',
    tags: ['Three.js', 'Next.js', 'TypeScript', 'Rapier', 'Firebase'],
    dateRange: 'Oct 2026',
    role: 'Developer @ Expert Listing',
    links: [
      CaseStudyLink(
        label: 'Play Lagos Landlord',
        url: 'https://lagos-landlord.vercel.app/play?ink=1',
      ),
    ],
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Make an explorable Lagos neighbourhood accessible from a browser '
            'link, with no install or sign-up before play. The experiment '
            'needed to balance a lively 3D world, mobile controls, persistent '
            'progress, and interactions with other players.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Separated the Next.js interface from a Three.js renderer through '
            'a typed world contract. Rapier physics runs in a Web Worker, '
            'while React stays out of the per-frame simulation. District '
            'layouts are data-driven, with quality tiers for different devices.',
      ),
      CaseStudySection(
        title: 'World & Persistence',
        content:
            'Built street exploration, driving, character interactions, and '
            'shareable moments. Firebase supports accounts, saved progress, '
            'and multiplayer presence; Cloud Functions decide earnings '
            'rather than trusting the browser. Playwright journeys cover '
            'player flows against Firebase emulators.',
      ),
      CaseStudySection(
        title: 'Outcome',
        content:
            'A publicly playable experiment extending my work beyond '
            'application interfaces into real-time graphics, simulation, '
            'and multiplayer state. The linked demo is the Three.js version.',
      ),
    ],
  ),

  // -- Beads Viewer (independent open-source tooling) --
  CaseStudy(
    slug: 'beads-viewer',
    title: 'Beads Viewer',
    subtitle: 'A Live Dashboard for Local Issue Trackers',
    summary:
        'Built an independent Next.js dashboard for Beads, distributed as '
        'view-beads on npm. Discover local projects, follow issue updates '
        'in the browser, and share a live board through a Cloudflare tunnel.',
    tags: ['Next.js', 'TypeScript', 'Developer Tooling', 'Open Source'],
    repoUrl: 'https://github.com/Prn-Ice/beads-viewer',
    links: [
      CaseStudyLink(
        label: 'view-beads on npm',
        url: 'https://www.npmjs.com/package/view-beads',
      ),
    ],
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Beads tracks work close to the code, but a terminal is not '
            'always the best place to scan multiple projects or show progress '
            'to a teammate. I wanted a browser view that works with the '
            'existing tracker instead of creating another source of truth.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Built a Next.js interface with shadcn/ui and Tailwind, backed '
            'by thin routes over the Beads CLI. Project discovery separates '
            'repositories from linked worktrees; optional GitHub mirrors '
            'read checked-in issue exports without pushing changes back.',
      ),
      CaseStudySection(
        title: 'Live Updates & Sharing',
        content:
            'Follow the Beads event journal and push updates to open boards, '
            'with polling when streams are unavailable. Server-mode projects '
            'can use the bd serve HTTP API instead of starting a CLI process '
            'for each read. Cloudflare tunnels let teammates view a board '
            'without installing the tool.',
      ),
      CaseStudySection(
        title: 'Delivery',
        content:
            'Packaged the standalone server as the view-beads npm CLI, with '
            'Nix support and Vitest/Playwright test workflows. Independent '
            'open-source tooling, not an official Beads product.',
      ),
    ],
  ),

  // -- 1. Search Architecture (featured) --
  CaseStudy(
    slug: 'search-architecture',
    title: 'Search Architecture',
    subtitle: 'Cross-Platform Search at Scale',
    summary:
        'Owned end-to-end search across Consumer (Flutter), Command (React), '
        'and CMS (Handlebars). Refactored 1 400+ LOC monolithic widgets into '
        'decomposed Bloc architecture.',
    tags: ['Flutter', 'Bloc', 'Google Maps', 'Cross-Platform'],
    dateRange: 'Mar 2023 – May 2026',
    role: 'Senior Mobile & Web Developer @ KWRI',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'The search experience spanned three platforms with vastly different '
            'tech stacks. On Flutter, MapView and SearchMapView were monolithic '
            'widgets exceeding 1 400 lines each — prop drilling, untestable '
            'business logic tangled with UI, and no clear separation of concerns.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Decomposed the monoliths into a clean component hierarchy: '
            'MapView \u2192 SearchMapView \u2192 SearchMapBloc \u2192 DrawingContainer \u2192 '
            'HoverContainer. All business logic moved into Bloc; the UI became '
            'pure reactive listeners. Introduced FilterScope, an enum driving '
            'four platform surfaces (consumer, command, cms, luxurySite) with '
            'distinct business logic per scope.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'The refactored architecture enabled rapid feature delivery:',
        bulletPoints: [
          'Autocomplete with grouped results and agent search',
          'Boundary, multi-boundary, and draw-to-search modes',
          'Filter system: Price, Living Area, Lot Size, Year Built',
          'Agent search with location filtering',
          'Interactive map with custom pin placement',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Became the team\'s Flutter reference after VGV departure. '
            'Reduced a specific widget-test feedback loop from 75 s to '
            'under 3 s by optimizing selectors. Contributed 525+ PRs across '
            '9 repos, with completed work associated with 99 distinct Jira '
            'release-version tags.',
      ),
    ],
  ),

  // -- 2. Search 2.0 / Command Platform --
  CaseStudy(
    slug: 'search-2-command',
    title: 'Search 2.0 \u2014 Command',
    subtitle: 'Agent Platform Feature Parity',
    summary:
        'Brought feature parity to the agent-facing Command platform. '
        'Migrated Redux \u2192 Zustand + React Query. Built Compare Map with '
        'geocoded pin placement.',
    tags: ['React', 'TypeScript', 'Zustand', 'GraphQL'],
    dateRange: 'Mar 2023 – May 2026',
    role: 'Senior Mobile & Web Developer @ KWRI',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'The agent-facing Command platform lacked the consumer search '
            'capabilities. The existing React codebase used a complex Redux '
            'setup that was difficult to extend and test.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Migrated state management from Redux to Zustand + React Query '
            'for a more ergonomic developer experience. Migrated legacy REST '
            'endpoints to GraphQL. Wrote extensive integration tests to '
            'ensure parity with the consumer experience.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'Delivered a complete agent search experience:',
        bulletPoints: [
          'Property card interactions with checkboxes and shift-click range selection',
          'Compare Map with subject overlays and custom pins',
          'Geocoded address placement for accurate pin positioning',
          'ULS endpoint migration to GraphQL',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Achieved feature parity across consumer and agent experiences, '
            'giving agents the same powerful search tools as end users.',
      ),
    ],
  ),

  // -- 3. Analytics & Observability --
  CaseStudy(
    slug: 'analytics-observability',
    title: 'Analytics & Observability',
    subtitle: 'Team-Wide Knowledge Enablement',
    summary:
        'Drove analytics coverage and created team-wide documentation. '
        'Authored 7 Confluence pages including GA4 tutorials with 6 video '
        'walkthroughs.',
    tags: ['GA4', 'Datadog', 'Documentation', 'Team Enablement'],
    dateRange: 'Mar 2023 – May 2026',
    role: 'Senior Mobile & Web Developer @ KWRI',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'The team lacked analytics literacy and debugging workflows. '
            'There was no shared documentation for GA4 reporting, search '
            'architecture decisions, or Flutter best practices.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Created a comprehensive GA4 guide with 6 video tutorials '
            'covering report creation, event debugging, and custom dimensions. '
            'Wrote debugging guides for both Web and Android platforms.',
      ),
      CaseStudySection(
        title: 'Documentation',
        content: 'Authored key architecture and developer documentation:',
        bulletPoints: [
          'GA4 Reports page with 6 video walkthroughs',
          'GA Debugging guide for Web and Android',
          'Search Map architecture documentation',
          'FilterScope usages across platforms',
          'Proposed Best Practices for Flutter development',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            '36 Confluence contributions. Established team-wide knowledge '
            'standards and served as the Flutter SME after VGV departure.',
      ),
    ],
  ),

  // -- 4. Skyewallet (featured) --
  CaseStudy(
    slug: 'skyewallet',
    title: 'Skyewallet',
    subtitle: 'Production Crypto Wallet',
    summary:
        'Production crypto wallet with buy/sell/swap, P2P marketplace, '
        'virtual debit cards, KYC verification. Published on App Store and '
        'Play Store.',
    tags: ['Flutter', 'Crypto', 'mTLS', 'Production'],
    dateRange: '2021 – 2023',
    role: 'Flutter Developer',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Build a full-feature crypto platform meeting regulatory '
            'requirements (KYC), security needs (mTLS certificate pinning), '
            'and supporting multi-country P2P transfers \u2014 all in Flutter.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'A comprehensive fintech platform:',
        bulletPoints: [
          'Crypto buy, sell, swap, send, and receive',
          'P2P marketplace for cross-border transfers',
          'Virtual debit cards',
          'Bill payments: airtime, cable, electricity',
          'Smile ID KYC verification',
        ],
      ),
      CaseStudySection(
        title: 'Technical Stack',
        content:
            'GetX for state management, Dio/Retrofit for networking, '
            'Firebase suite for analytics and messaging, flutter_secure_storage '
            'and local_auth for security, mTLS certificates for API security.',
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            '90+ production builds reaching v2.15.3. 807 lib files across '
            'the codebase. Published on both App Store and Play Store.',
      ),
    ],
  ),

  // -- 5. Flutter Architecture & Tooling --
  CaseStudy(
    slug: 'flutter-architecture-tooling',
    title: 'Flutter Architecture & Tooling',
    subtitle: 'Codified Opinions as Code',
    summary:
        'Codified opinionated Flutter architecture (heavy_app) with '
        'auto_route, injectable DI, 3 build flavors, melos monorepo. '
        'Plus 7 additional Mason templates on brickhub.dev.',
    tags: ['Mason', 'Architecture', 'DI', 'Monorepo', 'Published'],
    repoUrl: 'https://github.com/Prn-Ice/mason_bricks',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Every new Flutter project starts with the same boilerplate '
            'decisions \u2014 routing, dependency injection, state management, '
            'CI configuration, and linting rules.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Codified architectural opinions into Mason brick templates. '
            'heavy_app generates a complete project with auto_route, '
            'injectable/get_it, 3 flavors (dev/staging/prod), melos monorepo, '
            'custom packages (app_ui, bloc_logger, auto_route_observer), '
            'i18n, pre-commit hooks, and FVM.',
      ),
      CaseStudySection(
        title: 'Ecosystem',
        content: '8 bricks covering the full project lifecycle:',
        bulletPoints: [
          'heavy_app \u2014 full project scaffold',
          'heavy_repository_package & heavy_service_package',
          'cloud_messaging_service_package',
          'model_test \u2014 test generation for data models',
          'annoying_analysis_options \u2014 strict lint rules',
          'brick_starter \u2014 template for creating new bricks',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Published on brickhub.dev. Defines "how '
            'apps should be built" \u2014 not just building apps.',
      ),
    ],
  ),

  // -- 6. LenovoLegionLinuxFrontend --
  CaseStudy(
    slug: 'lenovo-legion-linux-frontend',
    title: 'LenovoLegionLinuxFrontend',
    subtitle: 'Flutter Desktop for Linux Hardware',
    summary:
        'Flutter desktop frontend for Lenovo Legion Linux: fan curves, '
        'power profiles, battery controls, GPU monitoring, and a live '
        'dashboard, with a typed service boundary for privileged operations.',
    tags: ['Flutter', 'Linux', 'Desktop', 'Hardware'],
    repoUrl: 'https://github.com/Prn-Ice/LenovoLegionLinuxFrontend',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'LenovoLegionLinux provided CLI-only fan control and power '
            'management for Legion laptops on Linux \u2014 no graphical interface '
            'for the community to use.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Built a Flutter desktop application providing visual controls '
            'for fan curves, power profiles, battery settings, and a live '
            'system dashboard. Read-only telemetry stays separate from '
            'privileged operations exposed through a typed D-Bus service.',
      ),
      CaseStudySection(
        title: 'Technical Stack',
        content:
            'Flutter desktop on Linux, D-Bus for system integration, and '
            'Polkit authorization for privileged actions. The service uses '
            'an operation allow-list and fixed command arguments rather '
            'than shell execution.',
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Demonstrates Flutter beyond mobile and web \u2014 desktop systems '
            'tooling with real hardware integration.',
      ),
    ],
  ),

  // -- 7. NixOS & Infrastructure --
  CaseStudy(
    slug: 'nixos-infrastructure',
    title: 'NixOS & Infrastructure',
    subtitle: 'Infrastructure as Code, Personally',
    summary:
        'Personal NixOS configuration with Flakes + Home-Manager, custom '
        'hardware support (Legion Slim 7), managed Android dev environments. '
        'OpenRGB hardware contribution.',
    tags: ['NixOS', 'Nix Flakes', 'Hardware', 'OpenRGB'],
    repoUrl: 'https://github.com/Prn-Ice/nixos-flaky-tests',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Reproducible development environments across machines and '
            'hardware support for newer Lenovo Legion laptops on Linux.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Declarative system configuration with Nix Flakes and '
            'Home-Manager for user-level config. Custom hardware modules '
            'for Legion Slim 7 support.',
      ),
      CaseStudySection(
        title: 'Contributions',
        content: 'Open-source contributions to the Linux hardware ecosystem:',
        bulletPoints: [
          'OpenRGB Legion 7s Gen8 hardware support (merged upstream)',
          'Legion-Slim-7-16APH8 documentation',
          'Reusable Nix development flakes',
        ],
      ),
      CaseStudySection(
        title: 'Impact',
        content:
            'Shows systems thinking \u2014 infrastructure as code applied to a '
            'personal development environment.',
      ),
    ],
  ),
];
