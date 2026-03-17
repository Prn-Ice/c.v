import 'package:jaspr/dom.dart';

import 'animations.dart';
import 'colors.dart';
import 'components.dart';
import 'glass.dart';
import 'layout.dart';
import 'pages.dart';
import 'responsive.dart';
import 'typography.dart';

/// Combined application styles for the Jaspr portfolio site.
final appStyles = <StyleRule>[
  ...colorStyles,
  ...typographyStyles,
  ...glassStyles,
  ...componentStyles,
  ...layoutStyles,
  ...pageStyles,
  ...animationStyles,
  ...responsiveStyles,
];
