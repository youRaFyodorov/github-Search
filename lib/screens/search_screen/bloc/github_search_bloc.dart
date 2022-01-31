import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/models/search_result.dart';
import 'package:top_git_rep/services/git_api_provider.dart';
import 'package:top_git_rep/services/language_provider.dart';

import 'github_search_event.dart';
import 'github_search_state.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.gitProvider})
      : super(const GithubSearchState());

  final GithubRepositoryProvider gitProvider;

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is InitEvent) {
      yield const LanguagesState(items: LanguageProvider.languages);
    } else if (event is OnTechnologySelectedEvent) {
      final List<String> resultList = LanguageProvider.languages
          .where((language) => language
              .toString()
              .toLowerCase()
              .contains(event.text.toLowerCase()))
          .toList();
      yield LanguagesState(items: resultList);
    } else if (event is GoToCurrentLanguageRepositoriesEvent) {
      yield LoadingState();
      final SearchResult searchResult =
          await gitProvider.search(event.language);
      yield RepositoriesState(repository: searchResult.repositories);
      yield const LanguagesState(items: LanguageProvider.languages);
    }
  }
}
