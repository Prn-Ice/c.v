import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

IconData mapIcon(AppIcon icon) {
  return switch (icon) {
    AppIcon.code => Icons.code,
    AppIcon.search => Icons.search,
    AppIcon.camera => Icons.camera_alt_outlined,
    AppIcon.headphones => Icons.headphones_outlined,
    AppIcon.terminal => Icons.terminal,
    AppIcon.public => Icons.public,
    AppIcon.sportsEsports => Icons.sports_esports_outlined,
    AppIcon.sportsSoccer => Icons.sports_soccer,
    AppIcon.person => Icons.person,
    AppIcon.email => Icons.email,
    AppIcon.photoLibrary => Icons.photo_library_outlined,
    AppIcon.arrowBack => Icons.arrow_back_rounded,
    AppIcon.menu => Icons.menu,
    AppIcon.close => Icons.close_rounded,
    AppIcon.lightMode => Icons.light_mode,
    AppIcon.darkMode => Icons.dark_mode,
  };
}
