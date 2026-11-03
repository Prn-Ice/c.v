import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../config.dart';
import '../icons/icon_mapper.dart';

class IconSpan extends StatelessComponent {
  const IconSpan({super.key, required this.icon, this.size = 24, this.classes});

  final AppIcon icon;
  final int size;
  final String? classes;

  @override
  Component build(BuildContext context) {
    return svg(
      viewBox: '0 0 24 24',
      width: size.px,
      height: size.px,
      classes: ['app-icon', ?classes].join(' '),
      attributes: {
        'fill': 'currentColor',
        'aria-hidden': 'true',
        'focusable': 'false',
      },
      [
        Component.element(
          tag: 'use',
          attributes: {'href': '$basePath/icons.svg#${mapIconName(icon)}'},
        ),
      ],
    );
  }
}
