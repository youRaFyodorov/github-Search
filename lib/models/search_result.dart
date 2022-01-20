import 'package:top_git_rep/models/search_result_item.dart';

class SearchResult {
  final List<Repository> repositories;

  const SearchResult({required this.repositories});

  static SearchResult fromJson(Map<String, dynamic> json) {
    final repositories = (json['items'] as List<dynamic>)
        .map(
            (dynamic item) => Repository.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(repositories: repositories);
  }
}
