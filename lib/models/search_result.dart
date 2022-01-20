import 'package:top_git_rep/models/search_result_item.dart';

class SearchResult {

  final List<Repository> items;

  const SearchResult({required this.items});
  
  static SearchResult fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List <dynamic>)
        .map((dynamic item) =>
          Repository.fromJson(item as Map<String, dynamic>))
        .toList();
    return SearchResult(items: items);
  }
}