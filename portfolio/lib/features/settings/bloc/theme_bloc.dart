import 'package:flutter/material.dart';
import 'package:riverbloc/riverbloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ThemeToggled>(_onToggled);
  }

  void _onToggled(ThemeToggled event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
      themeMode: state.isDark ? ThemeMode.light : ThemeMode.dark,
    ));
  }
}
