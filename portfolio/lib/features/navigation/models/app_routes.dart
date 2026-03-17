import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../about/view/about_page.dart';
import '../../case_study/view/case_study_page.dart';
import '../../home/view/home_page.dart';
import '../view/app_shell.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const caseStudy = '/case-study/:slug';

  static String caseStudyPath(String slug) => '/case-study/$slug';

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: home,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const HomePage(),
            ),
          ),
          GoRoute(
            path: about,
            pageBuilder: (context, state) => _fadePage(
              key: state.pageKey,
              child: const AboutPage(),
            ),
          ),
          GoRoute(
            path: caseStudy,
            pageBuilder: (context, state) {
              final slug = state.pathParameters['slug']!;
              return _fadePage(
                key: state.pageKey,
                child: CaseStudyPage(slug: slug),
              );
            },
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<void> _fadePage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionDuration: const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        // Fade out when this page is being replaced
        return FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: secondaryAnimation,
              curve: Curves.easeIn,
            ),
          ),
          child: FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.02),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
