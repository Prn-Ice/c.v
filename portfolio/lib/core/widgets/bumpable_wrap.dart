import 'package:flutter/material.dart';

import 'tech_tag.dart';

/// A [Wrap] of [TechTag] pills where hovering one tag triggers a
/// rightward chain-collision — the hovered tag nudges the one to its
/// right, which nudges the next, each with decreasing momentum.
class BumpableWrap extends StatefulWidget {
  const BumpableWrap({super.key, required this.labels});
  final List<String> labels;

  @override
  State<BumpableWrap> createState() => _BumpableWrapState();
}

class _BumpableWrapState extends State<BumpableWrap> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < widget.labels.length; i++)
          _BumpableTag(
            label: widget.labels[i],
            index: i,
            hoveredIndex: _hoveredIndex,
            onHoverChanged: (hovering) {
              setState(() => _hoveredIndex = hovering ? i : null);
            },
          ),
      ],
    );
  }
}

class _BumpableTag extends StatelessWidget {
  const _BumpableTag({
    required this.label,
    required this.index,
    required this.hoveredIndex,
    required this.onHoverChanged,
  });

  final String label;
  final int index;
  final int? hoveredIndex;
  final ValueChanged<bool> onHoverChanged;

  @override
  Widget build(BuildContext context) {
    // Only tags at or to the right of the hovered tag get pushed
    final isActive = hoveredIndex != null && index >= hoveredIndex!;
    final dist = isActive ? index - hoveredIndex! : 0;

    // Decreasing displacement: 6px, 3px, 2px, 1.5px, 1.2px
    final targetX = isActive && dist <= 4 ? 6.0 / (dist + 1) : 0.0;

    // Wave propagation: farther tags wait before moving (Interval delay)
    // On exit (isActive=false), return immediately with no delay
    final delay = isActive ? (dist * 0.15).clamp(0.0, 0.6) : 0.0;
    final Curve curve = delay > 0
        ? Interval(delay, 1.0, curve: Curves.easeOutCubic)
        : Curves.easeOutCubic;

    // Longer duration for the wave effect; shorter for snappy return
    final duration =
        isActive ? const Duration(milliseconds: 600) : const Duration(milliseconds: 300);

    return MouseRegion(
      onEnter: (_) => onHoverChanged(true),
      onExit: (_) => onHoverChanged(false),
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: targetX),
        duration: duration,
        curve: curve,
        builder: (context, dx, child) {
          return Transform.translate(
            offset: Offset(dx, 0),
            child: child,
          );
        },
        child: TechTag(label: label),
      ),
    );
  }
}
