import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/models/search_result.dart';
import 'package:top_git_rep/services/git_api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final GithubRepositoryProvider gitProvider;

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is InitEvent) {
      yield const LanguagesState(items: languages);
    } else if (event is OnTechnologySelectedEvent) {
      final List<String> resultList =
          languages.where((language) => language.contains(event.text)).toList();
      yield LanguagesState(items: resultList);
    } else if (event is GoToCurrentLanguageRepositoriesEvent) {
      yield LoadingState();
      final SearchResult searchResult =
      await gitProvider.search(event.language);
      yield RepositoriesState(repository: searchResult.repositories);
      yield const LanguagesState(items: languages);
    }
  }
}
