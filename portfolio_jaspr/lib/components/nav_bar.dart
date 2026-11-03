import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:shared/shared.dart';

import '../config.dart';
import 'icon_span.dart';

class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'nav-bar', [
      div(classes: 'nav-inner', [
        a(href: '$basePath/', classes: 'nav-logo', [
          Component.text('Prince Nna'),
        ]),
        div(classes: 'nav-links', [
          a(href: '$basePath/', [Component.text('Home')]),
          a(href: '$basePath/about/', [Component.text('About')]),
          button(
            id: 'theme-toggle',
            type: ButtonType.button,
            attributes: {'aria-label': 'Switch to light theme'},
            classes: 'theme-toggle',
            [
              const IconSpan(
                icon: AppIcon.darkMode,
                classes: 'theme-icon-dark',
              ),
              const IconSpan(
                icon: AppIcon.lightMode,
                classes: 'theme-icon-light',
              ),
            ],
          ),
        ]),
      ]),
    ]);
  }
}
