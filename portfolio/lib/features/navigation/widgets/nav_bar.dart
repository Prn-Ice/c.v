import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../settings/bloc/theme_event.dart';
import '../../settings/providers/theme_provider.dart';
import 'theme_toggle.dart';

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  static const _maxWidth = 1200.0;
  static const _height = 64.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeBlocProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final isNarrow = MediaQuery.sizeOf(context).width < 600;

    return Container(
      height: _height,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 0.08),
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                _Logo(onTap: () => context.go('/')),
                const Spacer(),
                if (isNarrow)
                  _MobileMenu(isDark: themeState.isDark, ref: ref)
                else
                  _DesktopNav(isDark: themeState.isDark, ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Prince Nna',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _DesktopNav extends StatelessWidget {
  const _DesktopNav({required this.isDark, required this.ref});
  final bool isDark;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavLink(label: 'Home', path: '/'),
        const SizedBox(width: 8),
        _NavLink(label: 'About', path: '/about'),
        const SizedBox(width: 8),
        ThemeToggle(
          isDark: isDark,
          onToggle: () =>
              ref.read(themeBlocProvider.bloc).add(ThemeToggled()),
        ),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({required this.isDark, required this.ref});
  final bool isDark;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ThemeToggle(
          isDark: isDark,
          onToggle: () =>
              ref.read(themeBlocProvider.bloc).add(ThemeToggled()),
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (path) => context.go(path),
          itemBuilder: (context) => const [
            PopupMenuItem(value: '/', child: Text('Home')),
            PopupMenuItem(value: '/about', child: Text('About')),
          ],
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.path});
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;
    final isActive = currentPath == path;
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: () => context.go(path),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color:
                  isActive ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}
