import 'package:jaspr/dom.dart';

/// CSS styles for page-specific layouts (hero, bento grid, about, case study).
final pageStyles = <StyleRule>[
  // ── Hero section ──────────────────────────────────────────
  css('.hero').styles(
    padding: Padding.symmetric(vertical: 80.px, horizontal: 0.px),
    textAlign: TextAlign.center,
    raw: {'padding-bottom': '48px'},
  ),
  css('.hero-subtitle').styles(
    color: Color.variable('--accent'),
    fontWeight: FontWeight.w600,
  ),
  css('.hero-summary').styles(
    maxWidth: 600.px,
    margin: Margin.symmetric(horizontal: Unit.auto),
    color: Color.variable('--on-surface-variant'),
    raw: {
      'margin-top': '16px',
      'margin-bottom': '32px',
      'line-height': '1.7',
    },
  ),
  css('.hero-ctas').styles(
    display: Display.flex,
    gap: Gap.all(12.px),
    justifyContent: JustifyContent.center,
    flexWrap: FlexWrap.wrap,
  ),

  // ── Buttons ───────────────────────────────────────────────
  css('.btn').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    gap: Gap.all(8.px),
    padding: Padding.symmetric(vertical: 12.px, horizontal: 24.px),
    radius: BorderRadius.circular(12.px),
    fontWeight: FontWeight.w600,
    textDecoration: TextDecoration.none,
    fontSize: 0.95.rem,
    raw: {'transition': 'all 0.2s'},
  ),
  css('.btn-filled').styles(
    raw: {
      'background': 'var(--accent)',
      'color': 'white',
    },
  ),
  css('.btn-filled:hover').styles(
    raw: {'background': 'var(--accent-light)'},
  ),
  css('.btn-outlined').styles(
    color: Color.variable('--on-surface'),
    raw: {'border': '1px solid var(--glass-border)'},
  ),
  css('.btn-outlined:hover').styles(
    raw: {'background': 'var(--surface-container-high)'},
  ),

  // ── Bento grid ────────────────────────────────────────────
  css('.bento-grid').styles(
    display: Display.grid,
    gap: Gap.all(16.px),
    raw: {
      'grid-template-columns': 'repeat(auto-fill, minmax(340px, 1fr))',
    },
  ),
  css('.bento-cell.span-2').styles(
    raw: {'grid-column': 'span 2'},
  ),

  // ── Skills grid ───────────────────────────────────────────
  css('.skills-grid').styles(
    display: Display.grid,
    gap: Gap.all(16.px),
    raw: {
      'grid-template-columns': 'repeat(auto-fill, minmax(280px, 1fr))',
    },
  ),

  // ── Section ───────────────────────────────────────────────
  css('.section').styles(
    padding: Padding.symmetric(vertical: 64.px, horizontal: 0.px),
  ),

  // ── Card link ─────────────────────────────────────────────
  css('.card-link').styles(
    textDecoration: TextDecoration.none,
    color: Color.inherit,
    display: Display.block,
  ),
  css('.card-subtitle').styles(
    color: Color.variable('--accent'),
    fontSize: 0.9.rem,
    raw: {'margin-bottom': '8px'},
  ),
  css('.card-summary').styles(
    color: Color.variable('--on-surface-variant'),
    fontSize: 0.9.rem,
    raw: {
      'line-height': '1.6',
      'margin-bottom': '16px',
    },
  ),

  // ── About page ────────────────────────────────────────────
  css('.bio-content').styles(
    maxWidth: 700.px,
  ),
  css('.bio-paragraph').styles(
    color: Color.variable('--on-surface-variant'),
    raw: {
      'line-height': '1.8',
      'margin-bottom': '24px',
    },
  ),
  css('.site-credits').styles(
    color: Color.variable('--on-surface-variant'),
    raw: {'font-style': 'italic'},
  ),
  css('.interests-grid').styles(
    display: Display.grid,
    gap: Gap.all(16.px),
    raw: {
      'grid-template-columns': 'repeat(auto-fill, minmax(300px, 1fr))',
    },
  ),
  css('.interest-row').styles(
    display: Display.flex,
    gap: Gap.all(16.px),
    alignItems: AlignItems.start,
  ),
  css('.interest-content h3').styles(
    margin: Margin.only(bottom: 8.px),
    raw: {'margin-top': '0'},
  ),
  css('.interest-content p').styles(
    color: Color.variable('--on-surface-variant'),
    fontSize: 0.9.rem,
    raw: {
      'margin': '0',
      'line-height': '1.6',
    },
  ),
  css('.contact-grid').styles(
    display: Display.grid,
    gap: Gap.all(16.px),
    raw: {
      'grid-template-columns': 'repeat(auto-fill, minmax(200px, 1fr))',
    },
  ),
  css('.contact-link').styles(
    display: Display.flex,
    alignItems: AlignItems.center,
    gap: Gap.all(12.px),
    textDecoration: TextDecoration.none,
    color: Color.variable('--on-surface'),
  ),

  // ── Case study page ───────────────────────────────────────
  css('.case-study-hero').styles(
    padding: Padding.symmetric(vertical: 48.px, horizontal: 0.px),
    raw: {'padding-bottom': '32px'},
  ),
  css('.back-link').styles(
    display: Display.inlineFlex,
    alignItems: AlignItems.center,
    gap: Gap.all(4.px),
    color: Color.variable('--on-surface-variant'),
    textDecoration: TextDecoration.none,
    raw: {'margin-bottom': '24px'},
  ),
  css('.back-link:hover').styles(
    color: Color.variable('--accent'),
  ),
  css('.role').styles(
    color: Color.variable('--accent'),
    fontWeight: FontWeight.w600,
  ),
  css('.date-range').styles(
    color: Color.variable('--on-surface-variant'),
    fontSize: 0.9.rem,
  ),
  css('.case-study-section').styles(
    raw: {'margin-bottom': '48px'},
  ),
  css('.case-study-section p').styles(
    color: Color.variable('--on-surface-variant'),
    raw: {'line-height': '1.8'},
  ),
  css('.case-study-section ul').styles(
    color: Color.variable('--on-surface-variant'),
    raw: {
      'line-height': '1.8',
      'padding-left': '24px',
    },
  ),
  css('.back-nav').styles(
    padding: Padding.symmetric(vertical: 48.px, horizontal: 0.px),
  ),
];
