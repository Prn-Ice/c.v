import 'package:riverbloc/riverbloc.dart';

import '../bloc/theme_bloc.dart';
import '../bloc/theme_state.dart';

final themeBlocProvider = BlocProvider<ThemeBloc, ThemeState>(
  (ref) => ThemeBloc(),
);
