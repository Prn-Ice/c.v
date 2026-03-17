import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class TechTag extends StatelessComponent {
  const TechTag({super.key, required this.label});

  final String label;

  @override
  Component build(BuildContext context) {
    return span(
      classes: 'tech-tag',
      [Component.text(label)],
    );
  }
}
