import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import 'icon_span.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-inner', [
        span([Component.text('Built with Jaspr')]),
        div(classes: 'footer-icons', [
          for (final link in socialLinks)
            a(href: link.url, target: Target.blank, [
              IconSpan(icon: link.icon, size: 20),
            ]),
        ]),
      ]),
    ]);
  }
}
