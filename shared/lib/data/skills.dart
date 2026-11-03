import '../models/skill_category.dart';

const skillCategories = [
  SkillCategory(
    name: 'Languages',
    skills: ['Dart', 'TypeScript', 'JavaScript', 'Python', 'HTML/CSS', 'Nix'],
  ),
  SkillCategory(
    name: 'Frameworks',
    skills: [
      'Flutter',
      'Jaspr',
      'React',
      'Next.js',
      'Django REST Framework',
      'dart_frog',
      'Hono',
      'NestJS',
      'Three.js',
      'Handlebars',
    ],
  ),
  SkillCategory(
    name: 'State & Data',
    skills: [
      'Bloc',
      'Riverpod',
      'Zustand',
      'React Query',
      'GraphQL',
      'Redux',
      'PostgreSQL',
      'Supabase',
      'Firebase',
    ],
  ),
  SkillCategory(
    name: 'Infrastructure',
    skills: ['NixOS', 'Nix Flakes', 'Docker', 'GitHub Actions', 'Codemagic'],
  ),
  SkillCategory(
    name: 'Testing',
    skills: [
      'Unit/Widget Testing',
      'Patrol',
      'Cypress',
      'Playwright',
      'Vitest',
    ],
  ),
  SkillCategory(
    name: 'Tooling',
    skills: ['Mason', 'Melos', 'Beads', 'Datadog', 'Google Analytics (GA4)'],
  ),
];
