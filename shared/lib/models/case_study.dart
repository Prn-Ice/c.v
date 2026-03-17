class CaseStudy {
  const CaseStudy({
    required this.slug,
    required this.title,
    required this.subtitle,
    required this.summary,
    required this.tags,
    required this.sections,
    this.repoUrl,
    this.liveUrl,
    this.dateRange,
    this.role,
    this.gridSpan = 1,
  });

  final String slug;
  final String title;
  final String subtitle;
  final String summary;
  final List<String> tags;
  final List<CaseStudySection> sections;
  final String? repoUrl;
  final String? liveUrl;
  final String? dateRange;
  final String? role;
  final int gridSpan;
}

class CaseStudySection {
  const CaseStudySection({
    required this.title,
    required this.content,
    this.bulletPoints,
  });

  final String title;
  final String content;
  final List<String>? bulletPoints;
}
