import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Shows a full-screen lightbox carousel of images matching the site's
/// glassmorphic dark aesthetic. Navigate with arrows, dots, or swipe.
Future<void> showImageCarousel(
  BuildContext context, {
  required List<String> assetPaths,
  String? title,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black87,
    builder: (context) => _CarouselDialog(
      assetPaths: assetPaths,
      title: title,
    ),
  );
}

class _CarouselDialog extends StatefulWidget {
  const _CarouselDialog({required this.assetPaths, this.title});
  final List<String> assetPaths;
  final String? title;

  @override
  State<_CarouselDialog> createState() => _CarouselDialogState();
}

class _CarouselDialogState extends State<_CarouselDialog> {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.sizeOf(context);
    final maxWidth = (size.width * 0.85).clamp(300.0, 900.0);
    final maxHeight = (size.height * 0.8).clamp(300.0, 700.0);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurfaceContainer : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark
                    ? AppColors.glassBorder
                    : Colors.grey.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      if (widget.title != null)
                        Expanded(
                          child: Text(
                            widget.title!,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),

                // ── Image area ──
                Flexible(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView.builder(
                        controller: _controller,
                        itemCount: widget.assetPaths.length,
                        onPageChanged: (i) =>
                            setState(() => _currentPage = i),
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                widget.assetPaths[i],
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Icon(Icons.image_not_supported,
                                      size: 48),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // Nav arrows
                      if (widget.assetPaths.length > 1) ...[
                        Positioned(
                          left: 4,
                          child: _NavArrow(
                            icon: Icons.chevron_left_rounded,
                            onTap: _currentPage > 0
                                ? () => _controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    )
                                : null,
                          ),
                        ),
                        Positioned(
                          right: 4,
                          child: _NavArrow(
                            icon: Icons.chevron_right_rounded,
                            onTap:
                                _currentPage < widget.assetPaths.length - 1
                                    ? () => _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeOut,
                                        )
                                    : null,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // ── Dot indicators ──
                if (widget.assetPaths.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < widget.assetPaths.length; i++)
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: _currentPage == i ? 24 : 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              color: _currentPage == i
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                      ],
                    ),
                  )
                else
                  const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  const _NavArrow({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: onTap,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.black26,
        disabledForegroundColor: Colors.white38,
      ),
    );
  }
}
