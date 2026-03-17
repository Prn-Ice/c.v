import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/cross_ref_banner.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CrossRefBanner(),
          const NavBar(),
          Expanded(child: child),
          const Footer(),
        ],
      ),
    );
  }
}
