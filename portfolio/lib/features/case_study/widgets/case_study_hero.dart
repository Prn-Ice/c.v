import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/bumpable_wrap.dart';
import 'package:shared/models/case_study.dart';

class CaseStudyHero extends StatelessWidget {
  const CaseStudyHero({super.key, required this.caseStudy});
  final CaseStudy caseStudy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return SectionContainer(
      maxWidth: 800,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isMobile ? 48 : 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back_rounded, size: 18),
              label: const Text('Back to Projects'),
            ),
            const SizedBox(height: 24),
            Text(
              caseStudy.title,
              style: isMobile
                  ? theme.textTheme.headlineLarge
                  : theme.textTheme.displayMedium,
            ),
            if (caseStudy.role != null) ...[
              const SizedBox(height: 8),
              Text(
                caseStudy.role!,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (caseStudy.dateRange != null) ...[
              const SizedBox(height: 4),
              Text(
                caseStudy.dateRange!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 16),
            BumpableWrap(labels: caseStudy.tags),
          ],
        ),
      ),
    );
  }
}
