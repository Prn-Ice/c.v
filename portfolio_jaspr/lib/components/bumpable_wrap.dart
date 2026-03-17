import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'tech_tag.dart';

class BumpableWrap extends StatelessComponent {
  const BumpableWrap({super.key, required this.labels});

  final List<String> labels;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'bump-wrap',
      [for (final label in labels) TechTag(label: label)],
    );
  }
}
