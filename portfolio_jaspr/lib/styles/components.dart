import 'package:jaspr/dom.dart';

/// CSS styles for reusable UI components (tech-tag, bump-wrap).
final componentStyles = <StyleRule>[
  // Tech tag: pill-shaped label for skills/technologies
  css('.tech-tag').styles(
    display: Display.inlineBlock,
    padding: Padding.symmetric(vertical: 6.px, horizontal: 14.px),
    backgroundColor: Color.variable('--surface-container-high'),
    color: Color.variable('--on-surface-variant'),
    radius: BorderRadius.circular(20.px),
    fontSize: 0.85.rem,
    fontWeight: FontWeight.w500,
    transition: Transition('transform',
        duration: 600.ms, curve: Curve.cubicBezier(0.33, 1, 0.68, 1)),
  ),

  // Bump wrap: flex container with gap for tech tags
  css('.bump-wrap').styles(
    display: Display.flex,
    flexWrap: FlexWrap.wrap,
    gap: Gap.all(8.px),
  ),

  // Bump effect: hovering a tag shifts subsequent siblings
  css('.bump-wrap:hover .tech-tag').styles(
    transition: Transition('transform',
        duration: 600.ms, curve: Curve.cubicBezier(0.33, 1, 0.68, 1)),
  ),
  css('.tech-tag:hover ~ .tech-tag:nth-of-type(n+1)').styles(
    transform: Transform.translate(x: 6.px),
  ),
  css('.tech-tag:hover ~ .tech-tag:nth-of-type(n+2)').styles(
    transform: Transform.translate(x: 3.px),
  ),
  css('.tech-tag:hover ~ .tech-tag:nth-of-type(n+3)').styles(
    transform: Transform.translate(x: 2.px),
  ),
];
