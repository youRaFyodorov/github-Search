import 'package:top_git_rep/models/search_result.dart';

class GithubRepository {
  const GithubRepository(this.client);

  final GithubRepository client;

  Future<SearchResult> search(String term) async {
    final result = await client.search(term);
    return result;
  }
}
