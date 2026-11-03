import 'package:jaspr/dom.dart';

/// Responsive media queries for mobile, small tablet, and tablet breakpoints.
final responsiveStyles = <StyleRule>[
  // Tablet: max-width 1024px (largest first for correct cascade)
  css.media(MediaQuery.all(maxWidth: 1024.px), [
    css('h1').styles(fontSize: 2.5.rem),
    css('section').styles(
      padding: Padding.symmetric(vertical: 32.px, horizontal: 24.px),
    ),
  ]),

  // A featured card must not create a second column below the two-card width.
  css.media(MediaQuery.all(maxWidth: 768.px), [
    css('.bento-grid').styles(raw: {'grid-template-columns': 'minmax(0, 1fr)'}),
    css('.bento-cell.span-2').styles(raw: {'grid-column': 'auto'}),
  ]),

  // Small tablet: max-width 600px — single column grids
  css.media(MediaQuery.all(maxWidth: 600.px), [
    css('.skills-grid, .interests-grid, .contact-grid')
        .styles(raw: {'grid-template-columns': 'minmax(0, 1fr)'}),
    css('section').styles(
      padding: Padding.symmetric(vertical: 24.px, horizontal: 16.px),
    ),
  ]),

  // Mobile: max-width 480px (smallest last to override broader rules)
  css.media(MediaQuery.all(maxWidth: 480.px), [
    css('h1').styles(fontSize: 2.rem),
    css('h2').styles(fontSize: 1.5.rem),
    css('h3').styles(fontSize: 1.25.rem),
    css('.glass-card').styles(padding: Padding.all(16.px)),
  ]),
];
