import '../app_icon.dart';
import '../models/interest.dart';

const interests = [
  Interest(
    title: 'Photography & Nature',
    description:
        'I like to take pictures, and I like to be in the green. '
        'Getting outside with a camera is how I reset.',
    icon: AppIcon.camera,
  ),
  Interest(
    title: 'Audio & Hardware',
    description:
        'I love audio hardware and music. From custom fan curves to '
        'headphone amps \u2014 if it has a circuit board, I\'m interested.',
    icon: AppIcon.headphones,
  ),
  Interest(
    title: 'Linux & NixOS',
    description:
        'Declarative system configuration with Nix Flakes and '
        'Home-Manager. My development environment is code.',
    icon: AppIcon.terminal,
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
  ),
  Interest(
    title: 'Manchester United',
    description: 'Through thick and thin. Mostly thin, lately.',
    icon: AppIcon.sportsSoccer,
  ),
];
