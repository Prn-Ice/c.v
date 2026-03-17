import '../app_icon.dart';

class Interest {
  const Interest({
    required this.title,
    required this.description,
    required this.icon,
    this.images = const [],
    this.linkText,
    this.linkUrl,
  });

  final String title;
  final String description;
  final AppIcon icon;
  final List<String> images;
  final String? linkText;
  final String? linkUrl;
}
