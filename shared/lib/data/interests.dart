import '../app_icon.dart';
import '../models/interest.dart';

const interests = [
  Interest(
    title: 'Photography & Nature',
    description:
        'I like to take pictures, and I like to be in the green. '
        'Getting outside with a camera is how I reset.',
    icon: AppIcon.camera,
    images: [
      'assets/images/photography/agc-20240824-080523646.webp',
      'assets/images/photography/agc-20250920-153623193.webp',
      'assets/images/photography/agc-20250920-164817139.webp',
      'assets/images/photography/20251027-141938.webp',
      'assets/images/photography/javav52ntl-20251220-134631924.webp',
      'assets/images/photography/20260214-193902.webp',
      'assets/images/photography/agc-20250718-121759601.webp',
      'assets/images/photography/agc-20250718-122128234.webp',
      'assets/images/photography/agc-20251102-091223899.webp',
      'assets/images/photography/javav52ntl-20251205-133436136.webp',
      'assets/images/photography/javav52ntl-20251205-133745380.webp',
      'assets/images/photography/javav52ntl-20251205-154020905.webp',
      'assets/images/photography/javav52ntl-20251220-153133769.webp',
      'assets/images/photography/javav52ntl-20251220-160438246.webp',
      'assets/images/photography/javav52ntl-20251220-160720072.webp',
    ],
  ),
  Interest(
    title: 'Audio & Hardware',
    description:
        'I love audio hardware and music. From custom fan curves to '
        'headphone amps \u2014 if it has a circuit board, I\'m interested.',
    icon: AppIcon.headphones,
    images: [
      'assets/images/photography/agc-20250707-151002015.webp',
      'assets/images/photography/agc-20250830-102501559.webp',
    ],
  ),
  Interest(
    title: 'Linux & NixOS',
    description:
        'Declarative system configuration with Nix Flakes and '
        'Home-Manager. My development environment is code.',
    icon: AppIcon.terminal,
    images: ['assets/images/photography/agc-20250705-003829942.webp'],
  ),
  Interest(
    title: 'Open Source',
    description:
        '50+ issues filed, contributions to Stacked, OpenRGB, and '
        'more. I believe in building in the open.',
    icon: AppIcon.public,
  ),
  Interest(
    title: 'Gaming & Tech',
    description:
        'I play video games sometimes \u2014 a lot less than I wish I could. '
        'I keep up with gaming and tech news and started a YouTube channel.',
    icon: AppIcon.sportsEsports,
    linkText: 'started a YouTube channel',
    linkUrl: 'https://www.youtube.com/@prn-ice',
    images: [
      'assets/images/photography/agc-20250830-110627673.webp',
      'assets/images/photography/agc-20250830-110749795.webp',
    ],
  ),
  Interest(
    title: 'Manchester United',
    description: 'Through thick and thin. Mostly thin, lately.',
    icon: AppIcon.sportsSoccer,
  ),
];
