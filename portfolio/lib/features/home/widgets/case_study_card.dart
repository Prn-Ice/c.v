import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/bumpable_wrap.dart';
import 'package:shared/models/case_study.dart';
import '../../navigation/models/app_routes.dart';

class CaseStudyCard extends StatelessWidget {
  const CaseStudyCard({super.key, required this.caseStudy});
  final CaseStudy caseStudy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GlassCard(
      onTap: () => context.go(AppRoutes.caseStudyPath(caseStudy.slug)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(caseStudy.title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(
              caseStudy.subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              caseStudy.summary,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            BumpableWrap(labels: caseStudy.tags.take(4).toList()),
          ],
        ),
      ),
    );
  }
}
