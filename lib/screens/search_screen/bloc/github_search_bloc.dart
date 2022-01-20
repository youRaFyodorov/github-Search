import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/models/search_result.dart';
import 'package:top_git_rep/services/git_api_provider.dart';

import 'github_search_event.dart';
import 'github_search_state.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.gitProvider})
      : super(const GithubSearchState());

  static const List<String> languages = [
    'java',
    'swift',
    'dart',
    'c#',
    'javaScript',
    'c++',
    'kotlin',
    'ruby'
  ];
  final GitProvider gitProvider;

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is InitEvent) {
      yield const StateWithLanguages(items: languages);
    } else if (event is OnTechnologySelected) {
      final List<String> resultList =
          languages.where((element) => element.contains(event.text)).toList();
      yield StateWithLanguages(items: resultList);
    } else if (event is GoToCurrentLanguageRepositories) {
      final SearchResult searchResult =
          await gitProvider.search(event.language);
      yield StateWithRepositories(repository: searchResult.items);
      yield const StateWithLanguages(items: languages);
    }
  }
}
