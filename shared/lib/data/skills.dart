import '../models/skill_category.dart';

const skillCategories = [
  SkillCategory(
    name: 'Languages',
    skills: ['Dart', 'TypeScript', 'JavaScript', 'HTML/CSS', 'Nix'],
  ),
  SkillCategory(
    name: 'Frameworks',
    skills: ['Flutter', 'React', 'Next.js', 'NestJS', 'Handlebars'],
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
    ],
  ),
  SkillCategory(
    name: 'Infrastructure',
    skills: [
      'NixOS',
      'Nix Flakes',
      'Docker',
      'GitHub Actions',
      'Codemagic',
    ],
  ),
  SkillCategory(
    name: 'Testing',
    skills: ['Unit/Widget Testing', 'Cypress', 'Playwright'],
  ),
  SkillCategory(
    name: 'Tooling',
    skills: ['Mason', 'Melos', 'Datadog', 'Google Analytics (GA4)'],
  ),
];
