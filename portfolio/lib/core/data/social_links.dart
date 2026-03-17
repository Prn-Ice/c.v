import 'package:flutter/material.dart';
import 'package:shared/shared.dart' as shared;

import '../icons/icon_mapper.dart';

class SocialLink {
  const SocialLink._({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final IconData icon;
}

final socialLinks = shared.socialLinks
    .map((l) => SocialLink._(
          label: l.label,
          url: l.url,
          icon: mapIcon(l.icon),
        ))
    .toList();
