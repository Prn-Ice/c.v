import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../config.dart';

class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'nav-bar', [
      div(classes: 'nav-inner', [
        a(href: '$basePath/', classes: 'nav-logo', [Component.text('Prince Nna')]),
        div(classes: 'nav-links', [
          a(href: '$basePath/', [Component.text('Home')]),
          a(href: '$basePath/about', [Component.text('About')]),
          button(
            id: 'theme-toggle',
            classes: 'theme-toggle',
            [
              span(
                classes: 'material-icons-outlined',
                [Component.text('dark_mode')],
              ),
            ],
          ),
        ]),
      ]),
    ]);
  }
}
