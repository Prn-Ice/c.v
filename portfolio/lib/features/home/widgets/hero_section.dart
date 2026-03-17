import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/widgets/section_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  static const _summary =
      'Senior Full Stack Engineer with 6+ years of production experience '
      'and a proven track record of cross-platform delivery, independently '
      'owning and evolving complex search architectures across Flutter, '
      'React, and Handlebars CMS ecosystems.';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return SectionContainer(
      child: Padding(
        padding: EdgeInsets.only(top: isMobile ? 64 : 120, bottom: isMobile ? 48 : 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prince Nna',
              style: isMobile
                  ? theme.textTheme.displayMedium
                  : theme.textTheme.displayLarge,
            )
                .animate()
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(begin: 0.3, end: 0, duration: 600.ms),
            const SizedBox(height: 12),
            Text(
              'Senior Full Stack Engineer',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colorScheme.primary,
              ),
            )
                .animate(delay: 200.ms)
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(begin: 0.3, end: 0, duration: 600.ms),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                _summary,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms, curve: Curves.easeOut)
                .slideY(begin: 0.2, end: 0, duration: 600.ms),
            const SizedBox(height: 40),
            _HeroCtas(isMobile: isMobile)
                .animate(delay: 600.ms)
                .fadeIn(duration: 400.ms, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }
}

class _HeroCtas extends StatelessWidget {
  const _HeroCtas({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      FilledButton(
        onPressed: () => launchUrl(
          Uri.parse('https://github.com/Prn-Ice'),
        ),
        child: const Text('GitHub'),
      ),
      OutlinedButton(
        onPressed: () => launchUrl(
          Uri.parse('https://linkedin.com/in/princenna'),
        ),
        child: const Text('LinkedIn'),
      ),
      OutlinedButton(
        onPressed: () => launchUrl(
          Uri.parse('mailto:stormprince77@gmail.com'),
        ),
        child: const Text('Contact'),
      ),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var i = 0; i < buttons.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            buttons[i],
          ],
        ],
      );
    }

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: buttons,
    );
  }
}
