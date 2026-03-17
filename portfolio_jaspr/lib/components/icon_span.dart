import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../icons/icon_mapper.dart';

class IconSpan extends StatelessComponent {
  const IconSpan({super.key, required this.icon, this.size = 24});

  final AppIcon icon;
  final int size;

  @override
  Component build(BuildContext context) {
    return span(
      classes: 'material-icons-outlined',
      styles: Styles(fontSize: size.px),
      [Component.text(mapIconName(icon))],
    );
  }
}
