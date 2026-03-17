import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class GlassCard extends StatelessComponent {
  const GlassCard({super.key, required this.child, this.onClick});

  final Component child;
  final VoidCallback? onClick;

  @override
  Component build(BuildContext context) {
    return div(
      classes: onClick != null ? 'glass-card clickable' : 'glass-card',
      events: onClick != null ? events(onClick: onClick!) : null,
      [child],
    );
  }
}
