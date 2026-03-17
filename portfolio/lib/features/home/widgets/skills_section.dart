import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/data/skills.dart';
import '../../../core/widgets/bumpable_wrap.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/section_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 48 : 80),
          Text(
            'Skills',
            style: isMobile
                ? theme.textTheme.headlineMedium
                : theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth > 600 ? 2 : 1;
              const gap = 16.0;
              final columnWidth =
                  (constraints.maxWidth - gap * (columns - 1)) / columns;

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (var i = 0; i < skillCategories.length; i++)
                    SizedBox(
                      width: columnWidth,
                      child: GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              skillCategories[i].name,
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: 12),
                            BumpableWrap(labels: skillCategories[i].skills),
                          ],
                        ),
                      )
                          .animate(delay: (100 * i).ms)
                          .fadeIn(
                            duration: 400.ms,
                            curve: Curves.easeOut,
                          )
                          .slideY(
                            begin: 0.15,
                            end: 0,
                            duration: 400.ms,
                            curve: Curves.easeOut,
                          ),
                    ),
                ],
              );
            },
          ),
          SizedBox(height: isMobile ? 48 : 80),
        ],
      ),
    );
  }
}
