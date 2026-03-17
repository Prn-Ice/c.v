import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/data/social_links.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  static const _maxWidth = 1200.0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
    final isNarrow = MediaQuery.sizeOf(context).width < 480;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: isNarrow
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final link in socialLinks)
                            IconButton(
                              icon: Icon(link.icon, size: 20),
                              color: colorScheme.onSurfaceVariant,
                              tooltip: link.label,
                              onPressed: () =>
                                  launchUrl(Uri.parse(link.url)),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Built with Flutter', style: textStyle),
                    ],
                  )
                : Row(
                    children: [
                      Text('Built with Flutter', style: textStyle),
                      const Spacer(),
                      for (final link in socialLinks)
                        IconButton(
                          icon: Icon(link.icon, size: 20),
                          color: colorScheme.onSurfaceVariant,
                          tooltip: link.label,
                          onPressed: () =>
                              launchUrl(Uri.parse(link.url)),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
