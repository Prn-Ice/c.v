import 'package:jaspr/dom.dart';

/// Global typography styles using CSS custom properties for theme-aware colors.
final typographyStyles = [
  css('body').styles(
    fontFamily: FontFamily.list([
      FontFamily('Plus Jakarta Sans'),
      FontFamilies.systemUi,
      FontFamilies.sansSerif,
    ]),
    color: Color.variable('--on-surface'),
    backgroundColor: Color.variable('--surface'),
    raw: {
      '-webkit-font-smoothing': 'antialiased',
      '-moz-osx-font-smoothing': 'grayscale',
    },
  ),
  css('h1').styles(
    fontSize: 3.5.rem,
    fontWeight: FontWeight.w700,
    lineHeight: 1.2.em,
  ),
  css('h2').styles(
    fontSize: 2.rem,
    fontWeight: FontWeight.w700,
    lineHeight: 1.3.em,
  ),
  css('h3').styles(
    fontSize: 1.5.rem,
    fontWeight: FontWeight.w600,
    lineHeight: 1.4.em,
  ),
  css('code, pre').styles(
    fontFamily: FontFamily.list([
      FontFamily('JetBrains Mono'),
      FontFamilies.monospace,
    ]),
  ),
  css('a').styles(
    color: Color.variable('--accent'),
    textDecoration: TextDecoration.none,
  ),
  css('a', [
    css('&:hover').styles(
      textDecoration: TextDecoration(line: TextDecorationLine.underline),
    ),
  ]),
];
