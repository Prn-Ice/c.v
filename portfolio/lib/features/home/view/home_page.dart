import 'package:flutter/material.dart';

import '../widgets/bento_grid.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(),
          BentoGrid(),
          SkillsSection(),
        ],
      ),
    );
  }
}
