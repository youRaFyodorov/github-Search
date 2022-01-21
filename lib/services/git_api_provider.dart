import 'dart:convert';
import 'dart:async';

import 'package:top_git_rep/models/search_result.dart';
import 'package:http/http.dart' as http;

class GithubRepositoryProvider {
  GithubRepositoryProvider({
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  static const String baseUrl =
      "https://api.github.com/search/repositories?q=language:";
  final http.Client httpClient;

  Future<SearchResult> search(String language) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$language"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw Exception("Error Search result");
    }
  }
}
