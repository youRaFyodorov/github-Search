class Repository {
  const Repository({
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
  });

  final String fullName;
  final String htmlUrl;
  final String description;
  final int stargazersCount;

  static Repository fromJson(dynamic json) {
    return Repository(
      fullName: json['full_name'] as String,
      htmlUrl: json['html_url'] as String,
      description: json['description'] != null
          ? json['description'] as String
          : 'No description',
      stargazersCount: json['stargazers_count'] as int,
    );
  }
}
