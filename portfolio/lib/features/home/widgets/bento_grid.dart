import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/data/case_studies.dart';
import '../../../core/widgets/section_container.dart';
import 'case_study_card.dart';

class BentoGrid extends StatelessWidget {
  const BentoGrid({super.key});

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
            'Projects',
            style: isMobile
                ? theme.textTheme.headlineMedium
                : theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final (columns, gap) = switch (width) {
                > 1024 => (3, 16.0),
                > 600 => (2, 16.0),
                _ => (1, 12.0),
              };

              final totalGap = gap * (columns - 1);
              final columnWidth = (width - totalGap) / columns;

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (var i = 0; i < caseStudies.length; i++)
                    SizedBox(
                      width: _cardWidth(
                        caseStudies[i].gridSpan,
                        columns,
                        columnWidth,
                        gap,
                      ),
                      child: CaseStudyCard(caseStudy: caseStudies[i])
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
        ],
      ),
    );
  }

  double _cardWidth(int span, int columns, double columnWidth, double gap) {
    final effectiveSpan = span.clamp(1, columns);
    if (effectiveSpan == 1) return columnWidth;
    return columnWidth * effectiveSpan + gap * (effectiveSpan - 1);
  }
}
