import '../models/case_study.dart';

const caseStudies = [
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
    dateRange: 'Mar 2023 – Present',
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
            'Achieved a 25\u00d7 test speed improvement (75 s \u2192 3 s) by optimizing '
            'widget selectors. Contributed to 525+ merged PRs across 9 repos '
            'and 99 production releases.',
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
    dateRange: 'Mar 2023 – Present',
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
    dateRange: 'Mar 2023 – Present',
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
            '7 stars on GitHub. Published on brickhub.dev. Defines "how '
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
        'Flutter desktop frontend for Lenovo Legion Linux fan control '
        'and power management tools.',
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
            'for fan curves, power profiles, and thermal management. '
            'Feature-first architecture with RiverBloc state management, '
            'matching production-grade patterns.',
      ),
      CaseStudySection(
        title: 'Technical Stack',
        content:
            'Flutter desktop (Linux), RiverBloc (Riverpod + Bloc), '
            'system-level D-Bus integration for hardware communication, '
            'feature-first directory structure.',
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
