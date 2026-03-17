import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../features/navigation/models/app_routes.dart';
import '../../features/settings/providers/theme_provider.dart';

class PortfolioApp extends ConsumerWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeBlocProvider);

    return MaterialApp.router(
      title: 'Prince Nna | Senior Full Stack Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeState.themeMode,
      routerConfig: AppRoutes.router,
    );
  }
}
