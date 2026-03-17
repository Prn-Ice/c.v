import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared/shared.dart' as shared;
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/social_links.dart';
import '../../../core/icons/icon_mapper.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/image_carousel_dialog.dart';
import '../../../core/widgets/section_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return SingleChildScrollView(
      child: Column(
        children: [
          // ── Bio ──────────────────────────────────────────────
          SectionContainer(
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 48 : 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: isMobile
                        ? theme.textTheme.headlineLarge
                        : theme.textTheme.displayMedium,
                  ),
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final paragraph in shared.bioParagraphs) ...[
                          Text(
                            paragraph,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant
                                  .withValues(alpha: 0.7),
                              fontStyle: FontStyle.italic,
                            ),
                            children: [
                              TextSpan(
                                text: shared.siteCreditsPrefix,
                              ),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () => launchUrl(
                                      Uri.parse(shared.siteCreditsLinkUrl),
                                    ),
                                    child: Text(
                                      shared.siteCreditsLinkText,
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.primary,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline,
                                        decorationColor: colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, curve: Curves.easeOut)
              .slideY(begin: 0.2, end: 0, duration: 600.ms),

          // ── Interests ────────────────────────────────────────
          SectionContainer(
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 48 : 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beyond Code',
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
                          (constraints.maxWidth - gap * (columns - 1)) /
                              columns;

                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final interest in shared.interests)
                            SizedBox(
                              width: columnWidth,
                              child: _InterestCard(interest: interest),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(duration: 500.ms, curve: Curves.easeOut)
              .slideY(begin: 0.15, end: 0, duration: 500.ms),

          // ── Contact ──────────────────────────────────────────
          SectionContainer(
            child: Padding(
              padding: EdgeInsets.only(
                top: isMobile ? 48 : 80,
                bottom: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get In Touch',
                    style: isMobile
                        ? theme.textTheme.headlineMedium
                        : theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 32),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = constraints.maxWidth > 600 ? 3 : 1;
                      const gap = 16.0;
                      final columnWidth =
                          (constraints.maxWidth - gap * (columns - 1)) /
                              columns;

                      return Wrap(
                        spacing: gap,
                        runSpacing: gap,
                        children: [
                          for (final link in socialLinks)
                            SizedBox(
                              width: columnWidth,
                              child: GlassCard(
                                onTap: () => launchUrl(Uri.parse(link.url)),
                                child: Row(
                                  children: [
                                    Icon(
                                      link.icon,
                                      color: colorScheme.primary,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      link.label,
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )
              .animate(delay: 400.ms)
              .fadeIn(duration: 500.ms, curve: Curves.easeOut)
              .slideY(begin: 0.15, end: 0, duration: 500.ms),
        ],
      ),
    );
  }
}

// ── Interest card with optional image carousel ─────────────────

class _InterestCard extends StatelessWidget {
  const _InterestCard({required this.interest});
  final shared.Interest interest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasImages = interest.images.isNotEmpty;

    return GlassCard(
      onTap: hasImages
          ? () => showImageCarousel(
                context,
                assetPaths: interest.images,
                title: interest.title,
              )
          : null,
      child: Row(
        children: [
          Icon(mapIcon(interest.icon), color: colorScheme.primary, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(interest.title, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                _DescriptionText(interest: interest),
              ],
            ),
          ),
          if (hasImages)
            Icon(
              Icons.photo_library_outlined,
              size: 18,
              color: colorScheme.onSurfaceVariant,
            ),
        ],
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  const _DescriptionText({required this.interest});
  final shared.Interest interest;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );

    final linkText = interest.linkText;
    final linkUrl = interest.linkUrl;

    if (linkText == null || linkUrl == null) {
      return Text(interest.description, style: style);
    }

    final parts = interest.description.split(linkText);
    if (parts.length < 2) {
      return Text(interest.description, style: style);
    }

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: parts[0]),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrl(Uri.parse(linkUrl)),
                child: Text(
                  linkText,
                  style: style?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          TextSpan(text: parts.sublist(1).join(linkText)),
        ],
      ),
    );
  }
}
