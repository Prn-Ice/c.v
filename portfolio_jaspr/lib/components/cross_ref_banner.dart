import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

class CrossRefBanner extends StatelessComponent {
  const CrossRefBanner({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'cross-ref-banner', [
      Component.text('This is the SEO-friendly Jaspr version. '),
      a(href: flutterSiteUrl, [
        Component.text('View the interactive Flutter version \u2192'),
      ]),
    ]);
  }
}
