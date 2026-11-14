import '../models/case_study.dart';

const caseStudies = [
  // -- Expert Listing (featured, September–October 2026 engagement) --
  CaseStudy(
    slug: 'expert-listing',
    title: 'Expert Listing',
    subtitle: 'One Dart Core, Two Clients',
    summary:
        'I led mobile development and rebuilt the Flutter app and Jaspr '
        'website around shared Dart packages. The mobile rebuild reached '
        'the stores 24 days after its first commit. I also helped hire '
        'mobile and backend developers.',
    tags: ['Flutter', 'Jaspr', 'Riverpod', 'Django REST', 'Team Leadership'],
    dateRange: 'Sep 2026 – Oct 2026',
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
            'I led the mobile team and worked with the business '
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

  // -- Ester (featured, independent product) --
  CaseStudy(
    slug: 'ester',
    title: 'Ester',
    subtitle: 'Visitor Access Through WhatsApp',
    summary:
        'I built Ester to help residents invite visitors, guards check access, '
        'and managers run an estate. Visitor codes and gate checks happen in '
        'WhatsApp, with a Flutter dashboard for estate management and a '
        'Jaspr website at ester.ng.',
    tags: ['Dart', 'Flutter', 'Jaspr', 'Dart Frog', 'Supabase', 'WhatsApp'],
    role: 'Full-Stack Engineer',
    liveUrl: 'https://ester.ng',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Give residents, visitors, and guards a clear way to arrange '
            'and check visits without asking everyone to install another '
            'app. A single home needs a simple setup; a shared estate also '
            'needs house records, resident onboarding, and manager oversight.',
      ),
      CaseStudySection(
        title: 'The Product',
        content:
            'Built two ways to use Ester: manage a home or street through '
            'WhatsApp, or add a web dashboard for estate managers. Residents '
            'create and share visitor codes. Guards check the visitor details '
            'before recording entry or exit.',
        bulletPoints: [
          'WhatsApp forms and menus for visitor codes and gate checks',
          'Resident invitations and registration requests for manager review',
          'Flutter dashboard for houses, residents, guards, and entry records',
        ],
      ),
      CaseStudySection(
        title: 'Architecture',
        content:
            'Kept the product in one Dart workspace: a Dart Frog API and '
            'WhatsApp bot, a Flutter dashboard, and a server-rendered Jaspr '
            'website. Shared packages hold models, repositories, and '
            'dependency wiring. Supabase provides Postgres and authentication; '
            'Bloc and Cubit manage dashboard behaviour, with Riverpod '
            'supplying dependencies through Riverbloc.',
      ),
      CaseStudySection(
        title: 'Access Decisions',
        content:
            'Gate decisions recheck the current membership and authority in '
            'the database. Admitting a visitor records the entry and consumes '
            'the code in one transaction. WhatsApp form contexts are signed, '
            'time-limited, and bound to the sender and estate.',
      ),
      CaseStudySection(
        title: 'Delivery',
        content:
            'The public website is live at ester.ng. The project uses '
            'Railway for the website, API, and self-hosted Supabase, with '
            'Cloudflare Pages for the Flutter dashboard. The release workflow '
            'runs analysis, tests, builds, reviewed database migrations, '
            'and public service health checks.',
      ),
    ],
  ),

  // -- findaphone.ng (featured, independent product) --
  CaseStudy(
    slug: 'findaphone',
    title: 'findaphone.ng',
    subtitle: 'A Phone-Buying Platform for Nigeria',
    summary:
        'I built findaphone.ng to help Nigerians choose a phone. It brings '
        'recommendations, marketplace listings, and reviewed device-support '
        'records together, with a Jaspr website, Dart API, and catalogue tools.',
    tags: ['Dart', 'Jaspr', 'dart_frog', 'Supabase', 'Melos', 'Founder'],
    dateRange: 'Apr 2026 – Present',
    role: 'Library Curator @ findaphone.ng',
    liveUrl: 'https://findaphone.ng',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Buying a phone in Nigeria means sorting through unclear prices, '
            'inconsistent specifications, and suspect listings on different '
            'marketplaces. I wanted to help people find a phone that fits '
            'their budget and priorities, then judge the listings they find.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Used one Dart monorepo managed with Melos to share typed models '
            'and business logic across a Jaspr static '
            'site with @client interactive islands, a dart_frog REST API that '
            'loads the whole catalogue into memory at boot, a pure-Dart '
            'scraper, and Supabase Postgres with row-level security.',
      ),
      CaseStudySection(
        title: 'Curation Engine',
        content:
            'Automated matching and human review keep marketplace data '
            'separate from the curated phone catalogue:',
        bulletPoints: [
          'Confidence-scored matcher (Jaccard similarity, brand multiplier, '
              'exact-model boost) routes listings for automatic approval, '
              'manual review, or catalogue expansion',
          'Admin review workflow protects already-reviewed rows from '
              'being overwritten by later scrapes',
          'Four idempotent enrichment pipelines (spec sheets, benchmark '
              'scores, review data, image rehosting), each writing its own '
              'set of columns without duplicating records on repeat runs',
          'Two-signal price-sanity filter catches listing scams, including a '
              'real mismatched-device listing in production',
        ],
      ),
      CaseStudySection(
        title: 'Device Support and Approval Records',
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
              'tools preserve review decisions and their sources',
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
            'The experiment is publicly playable and combines browser '
            'graphics, physics, and multiplayer state. The linked demo '
            'is the Three.js version.',
      ),
    ],
  ),

  // -- Beads Viewer (independent open-source tooling) --
  CaseStudy(
    slug: 'beads-viewer',
    title: 'Beads Viewer',
    subtitle: 'A Live Dashboard for Local Issue Trackers',
    summary:
        'I built a browser dashboard for Beads issue trackers, published '
        'as view-beads on npm. It finds local projects, shows live issue '
        'updates, and lets teammates view a board through a Cloudflare tunnel.',
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
            'The server follows the Beads event journal and updates open boards, '
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
    subtitle: 'Property Search Across Mobile and Web',
    summary:
        'I worked on Keller Williams search across Flutter, React, and '
        'Handlebars. I helped split Flutter widgets of over 1,400 lines '
        'into smaller components and Blocs.',
    tags: ['Flutter', 'Bloc', 'Google Maps', 'Cross-Platform'],
    dateRange: 'Mar 2023 – May 2026',
    role: 'Senior Mobile & Web Developer @ KWRI',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'The search experience spanned three platforms with different '
            'tech stacks. On Flutter, MapView and SearchMapView were monolithic '
            'widgets exceeding 1,400 lines each. Business logic and UI were '
            'tangled together, making changes and tests difficult.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Split the widgets into focused components: '
            'MapView \u2192 SearchMapView \u2192 SearchMapBloc \u2192 DrawingContainer \u2192 '
            'HoverContainer. Moved business logic into Bloc and let the UI '
            'respond to state. Introduced FilterScope, an enum used across '
            'four platform surfaces (consumer, command, cms, luxurySite) with '
            'distinct business logic per scope.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'Built and maintained these search flows:',
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
            'Became a Flutter reference for the team after the Very Good '
            'Ventures consultants left. '
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
    subtitle: 'Property Search for Agents',
    summary:
        'I helped bring consumer search tools to the React-based Command '
        'platform for agents, migrate Redux state to Zustand and React Query, '
        'and build Compare Map with address-based pin placement.',
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
            'to simplify state and server-data handling. Updated clients '
            'from legacy REST endpoints to GraphQL and wrote integration '
            'tests for the search flows.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'The work covered:',
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
            'Brought consumer search capabilities into the agent platform, '
            'including map comparisons and multi-listing selection.',
      ),
    ],
  ),

  // -- 3. Analytics & Observability --
  CaseStudy(
    slug: 'analytics-observability',
    title: 'Analytics & Observability',
    subtitle: 'Analytics and Debugging Guides for the Team',
    summary:
        'I improved search analytics coverage and wrote seven Confluence '
        'pages on reporting, debugging, and architecture, including six '
        'GA4 video walkthroughs.',
    tags: ['GA4', 'Datadog', 'Documentation', 'Team Enablement'],
    dateRange: 'Mar 2023 – May 2026',
    role: 'Senior Mobile & Web Developer @ KWRI',
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'The team needed shared guides for GA4 reports and debugging, '
            'search architecture, and Flutter development practices.',
      ),
      CaseStudySection(
        title: 'Approach',
        content:
            'Created a GA4 guide with six video tutorials '
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
            'Contributed to 36 Confluence items and gave teammates shared '
            'references for reporting, debugging, and Flutter architecture.',
      ),
    ],
  ),

  // -- 4. Skyewallet (featured) --
  CaseStudy(
    slug: 'skyewallet',
    title: 'Skyewallet',
    subtitle: 'Production Crypto Wallet',
    summary:
        'I built Flutter wallet flows for buying and transferring crypto, '
        'peer-to-peer payments, virtual cards, and identity verification. '
        'The app shipped on Android and iOS.',
    tags: ['Flutter', 'Crypto', 'mTLS', 'Production'],
    dateRange: '2021 – 2023',
    role: 'Flutter Developer',
    gridSpan: 2,
    sections: [
      CaseStudySection(
        title: 'Challenge',
        content:
            'Build Flutter wallet flows with identity verification, mTLS '
            'API security, and peer-to-peer transfers across countries.',
      ),
      CaseStudySection(
        title: 'Key Features',
        content: 'The app supports:',
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
            'Delivered work across 90+ builds through v2.15.3, with '
            'the app published on the App Store and Play Store.',
      ),
    ],
  ),

  // -- 5. Flutter Architecture & Tooling --
  CaseStudy(
    slug: 'flutter-architecture-tooling',
    title: 'Flutter Architecture & Tooling',
    subtitle: 'Reusable Flutter Project Templates',
    summary:
        'I published eight Mason templates for Flutter projects. The '
        'heavy_app template sets up routing, dependency injection, build '
        'flavours, and a Melos monorepo; others cover packages and tests.',
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
            'Turned repeated project setup into Mason templates. '
            'heavy_app generates a complete project with auto_route, '
            'injectable/get_it, 3 flavors (dev/staging/prod), melos monorepo, '
            'custom packages (app_ui, bloc_logger, auto_route_observer), '
            'i18n, pre-commit hooks, and FVM.',
      ),
      CaseStudySection(
        title: 'Ecosystem',
        content:
            'The eight templates cover apps, packages, tests, and linting:',
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
            'Published on brickhub.dev so other developers can reuse '
            'the same setup rather than assemble it for each project.',
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
            'Provides graphical controls for Linux laptop hardware, keeping '
            'read-only monitoring separate from authorized system changes.',
      ),
    ],
  ),

  // -- 7. NixOS & Infrastructure --
  CaseStudy(
    slug: 'nixos-infrastructure',
    title: 'NixOS & Infrastructure',
    subtitle: 'My Development Environment as Code',
    summary:
        'I manage my Linux systems and Android development environments '
        'with Nix Flakes and Home-Manager, including hardware configuration '
        'for my Legion Slim 7. I also contributed hardware support to OpenRGB.',
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
            'Keeps system and development settings in version control '
            'so I can reproduce the setup across machines.',
      ),
    ],
  ),
];
