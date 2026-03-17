import 'package:jaspr/dom.dart';

/// Keyframe animations and stagger utility classes.
final animationStyles = <StyleRule>[
  // Keyframe: fadeSlideUp
  css.keyframes('fadeSlideUp', {
    'from': Styles(
      opacity: 0,
      transform: Transform.translate(y: 20.px),
    ),
    'to': Styles(
      opacity: 1,
      transform: Transform.translate(y: Unit.zero),
    ),
  }),

  // .animate-in applies the fadeSlideUp animation
  css('.animate-in').styles(
    animation: Animation(
      name: 'fadeSlideUp',
      duration: 600.ms,
      curve: Curve.easeOut,
      fillMode: AnimationFillMode.both,
    ),
  ),

  // Stagger classes with increasing animation-delay
  css('.stagger-1').styles(raw: {'animation-delay': '0.1s'}),
  css('.stagger-2').styles(raw: {'animation-delay': '0.2s'}),
  css('.stagger-3').styles(raw: {'animation-delay': '0.3s'}),
  css('.stagger-4').styles(raw: {'animation-delay': '0.4s'}),
  css('.stagger-5').styles(raw: {'animation-delay': '0.5s'}),
  css('.stagger-6').styles(raw: {'animation-delay': '0.6s'}),
];
