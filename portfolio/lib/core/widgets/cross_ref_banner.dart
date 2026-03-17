import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class CrossRefBanner extends StatelessWidget {
  const CrossRefBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: colorScheme.surfaceContainerHigh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Also available as an SEO-friendly Jaspr site. ',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse(jasprSiteUrl)),
              child: Text(
                'View Jaspr version \u2192',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
