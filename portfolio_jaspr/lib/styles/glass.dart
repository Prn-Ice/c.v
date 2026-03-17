import 'package:jaspr/dom.dart';

/// Glass-morphism card styles.
final glassStyles = [
  css('.glass-card').styles(
    backdropFilter: Filter.blur(12.px),
    radius: BorderRadius.circular(16.px),
    padding: Padding.all(24.px),
    transition: Transition.combine([
      Transition('transform', duration: 200.ms, curve: Curve.easeOut),
      Transition('box-shadow', duration: 200.ms, curve: Curve.easeOut),
    ]),
    raw: {
      'background': 'var(--glass-bg)',
      'border': '1px solid var(--glass-border)',
    },
  ),
  css('.glass-card', [
    css('&:hover').styles(
      transform: Transform.scale(1.02),
      raw: {
        'box-shadow': 'var(--shadow)',
      },
    ),
  ]),
  css('.glass-card.clickable').styles(
    cursor: Cursor.pointer,
  ),
];
