import 'package:shared/shared.dart';

/// Maps [AppIcon] to Material Icons Outlined web font ligature names.
String mapIconName(AppIcon icon) {
  return switch (icon) {
    AppIcon.code => 'code',
    AppIcon.search => 'search',
    AppIcon.camera => 'camera_alt',
    AppIcon.headphones => 'headphones',
    AppIcon.terminal => 'terminal',
    AppIcon.public => 'public',
    AppIcon.sportsEsports => 'sports_esports',
    AppIcon.sportsSoccer => 'sports_soccer',
    AppIcon.person => 'person',
    AppIcon.email => 'email',
    AppIcon.photoLibrary => 'photo_library',
    AppIcon.arrowBack => 'arrow_back',
    AppIcon.menu => 'menu',
    AppIcon.close => 'close',
    AppIcon.lightMode => 'light_mode',
    AppIcon.darkMode => 'dark_mode',
  };
}
