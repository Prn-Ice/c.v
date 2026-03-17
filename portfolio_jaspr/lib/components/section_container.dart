import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SectionContainer extends StatelessComponent {
  const SectionContainer({
    super.key,
    required this.child,
    this.maxWidth = 1200,
  });

  final Component child;
  final int maxWidth;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'section-container',
      styles: Styles(
        maxWidth: maxWidth.px,
        margin: Margin.symmetric(horizontal: Unit.auto),
        padding: Padding.symmetric(horizontal: 24.px),
      ),
      [child],
    );
  }
}
