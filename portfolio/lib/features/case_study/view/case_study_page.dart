import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/case_studies.dart';
import '../../../core/widgets/section_container.dart';
import '../widgets/case_study_hero.dart';
import '../widgets/case_study_section_widget.dart';

class CaseStudyPage extends StatelessWidget {
  const CaseStudyPage({super.key, required this.slug});
  final String slug;

  @override
  Widget build(BuildContext context) {
    final study = caseStudies.where((s) => s.slug == slug).firstOrNull;

    if (study == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Project not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          CaseStudyHero(caseStudy: study),
          SectionContainer(
            maxWidth: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < study.sections.length; i++)
                  CaseStudySectionWidget(section: study.sections[i])
                      .animate(delay: (100 * i).ms)
                      .fadeIn(duration: 400.ms, curve: Curves.easeOut)
                      .slideY(
                        begin: 0.1,
                        end: 0,
                        duration: 400.ms,
                        curve: Curves.easeOut,
                      ),
                if (study.externalLinks.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        for (final link in study.externalLinks)
                          OutlinedButton.icon(
                            onPressed: () => launchUrl(Uri.parse(link.url)),
                            icon: const Icon(Icons.open_in_new),
                            label: Text(link.label),
                          ),
                      ],
                    ),
                  ),
                Center(
                  child: TextButton.icon(
                    onPressed: () => context.go('/'),
                    icon: const Icon(Icons.arrow_back_rounded, size: 18),
                    label: const Text('Back to Projects'),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
