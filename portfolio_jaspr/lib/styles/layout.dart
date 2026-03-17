import 'package:jaspr/dom.dart';

/// CSS styles for nav bar, footer, and cross-reference banner.
final layoutStyles = <StyleRule>[
  // ── Nav bar ──────────────────────────────────────────────
  css('.nav-bar').styles(
    position: Position.sticky(top: 0.px),
    zIndex: ZIndex(100),
    raw: {
      'background': 'var(--surface)',
      'border-bottom': '1px solid var(--glass-border)',
      'backdrop-filter': 'blur(12px)',
    },
  ),
  css('.nav-inner').styles(
    maxWidth: 1200.px,
    margin: Margin.symmetric(horizontal: Unit.auto),
    padding: Padding.symmetric(vertical: 16.px, horizontal: 24.px),
    display: Display.flex,
    justifyContent: JustifyContent.spaceBetween,
    alignItems: AlignItems.center,
  ),
  css('.nav-logo').styles(
    fontSize: 1.25.rem,
    fontWeight: FontWeight.w700,
    color: Color.variable('--on-surface'),
    textDecoration: TextDecoration.none,
  ),
  css('.nav-links').styles(
    display: Display.flex,
    gap: Gap.all(24.px),
    alignItems: AlignItems.center,
  ),
  css('.nav-links a').styles(
    color: Color.variable('--on-surface-variant'),
    textDecoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
  ),
  css('.nav-links a:hover').styles(
    color: Color.variable('--accent'),
  ),
  css('.theme-toggle').styles(
    padding: Padding.all(8.px),
    cursor: Cursor.pointer,
    color: Color.variable('--on-surface-variant'),
    display: Display.flex,
    alignItems: AlignItems.center,
    radius: BorderRadius.circular(8.px),
    raw: {
      'background': 'none',
      'border': '1px solid var(--glass-border)',
    },
  ),

  // ── Footer ───────────────────────────────────────────────
  css('.site-footer').styles(
    padding: Padding.symmetric(vertical: 32.px, horizontal: 24.px),
    raw: {
      'border-top': '1px solid var(--glass-border)',
      'margin-top': '80px',
    },
  ),
  css('.footer-inner').styles(
    maxWidth: 1200.px,
    margin: Margin.symmetric(horizontal: Unit.auto),
    display: Display.flex,
    justifyContent: JustifyContent.spaceBetween,
    alignItems: AlignItems.center,
    color: Color.variable('--on-surface-variant'),
    fontSize: 0.875.rem,
  ),
  css('.footer-icons').styles(
    display: Display.flex,
    gap: Gap.all(16.px),
  ),
  css('.footer-icons a').styles(
    color: Color.variable('--on-surface-variant'),
  ),
  css('.footer-icons a:hover').styles(
    color: Color.variable('--accent'),
  ),

  // ── Cross-ref banner ─────────────────────────────────────
  css('.cross-ref-banner').styles(
    textAlign: TextAlign.center,
    padding: Padding.symmetric(vertical: 8.px, horizontal: 16.px),
    fontSize: 0.875.rem,
    raw: {
      'background': 'var(--accent)',
      'color': 'white',
    },
  ),
  css('.cross-ref-banner a').styles(
    fontWeight: FontWeight.w600,
    textDecoration: TextDecoration(line: TextDecorationLine.underline),
    raw: {
      'color': 'white',
    },
  ),
];
