import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});

  final ThemeMode themeMode;

  factory ThemeState.initial() => const ThemeState(themeMode: ThemeMode.dark);

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  bool get isDark => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [themeMode];
}
