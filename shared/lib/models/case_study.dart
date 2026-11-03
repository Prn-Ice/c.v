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
    this.links = const [],
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
  final List<CaseStudyLink> links;
  final String? dateRange;
  final String? role;
  final int gridSpan;

  List<CaseStudyLink> get externalLinks => [
    if (liveUrl != null)
      CaseStudyLink(label: 'View live project', url: liveUrl!),
    if (repoUrl != null) CaseStudyLink(label: 'View on GitHub', url: repoUrl!),
    ...links,
  ];
}

class CaseStudyLink {
  const CaseStudyLink({required this.label, required this.url});

  final String label;
  final String url;
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
