import 'package:flutter/material.dart';

abstract final class AppColors {
  // Warm accent — inspired by Yaru's warmth
  static const accent = Color(0xFFE95420);
  static const accentLight = Color(0xFFFF7043);

  // Dark mode surfaces
  static const darkSurface = Color(0xFF0F0F0F);
  static const darkSurfaceContainer = Color(0xFF1A1A1A);
  static const darkSurfaceContainerHigh = Color(0xFF242424);
  static const darkOnSurface = Color(0xFFF5F5F5);
  static const darkOnSurfaceVariant = Color(0xFFB0B0B0);

  // Light mode surfaces
  static const lightSurface = Color(0xFFFAFAFA);
  static const lightSurfaceContainer = Color(0xFFFFFFFF);
  static const lightSurfaceContainerHigh = Color(0xFFF0F0F0);
  static const lightOnSurface = Color(0xFF1A1A1A);
  static const lightOnSurfaceVariant = Color(0xFF666666);

  // Glass effect colors (dark mode cards)
  static const glassBackground = Color(0x08FFFFFF);
  static const glassBorder = Color(0x1AFFFFFF);
}
