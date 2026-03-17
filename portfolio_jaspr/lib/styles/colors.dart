import 'package:jaspr/dom.dart';

/// CSS custom properties for light/dark theme.
/// Dark is default, light via `[data-theme="light"]`.
final colorStyles = [
  css(':root').styles(raw: {
    '--accent': '#E95420',
    '--accent-light': '#FF7043',
    '--surface': '#0F0F0F',
    '--surface-container': '#1A1A1A',
    '--surface-container-high': '#242424',
    '--on-surface': '#F5F5F5',
    '--on-surface-variant': '#B0B0B0',
    '--glass-bg': 'rgba(255,255,255,0.03)',
    '--glass-border': 'rgba(255,255,255,0.1)',
    '--shadow': 'none',
  }),
  css('[data-theme="light"]').styles(raw: {
    '--surface': '#FAFAFA',
    '--surface-container': '#FFFFFF',
    '--surface-container-high': '#F0F0F0',
    '--on-surface': '#1A1A1A',
    '--on-surface-variant': '#666666',
    '--glass-bg': 'var(--surface-container)',
    '--glass-border': 'rgba(0,0,0,0.06)',
    '--shadow': '0 2px 8px rgba(0,0,0,0.05)',
  }),
];
