import 'package:equatable/equatable.dart';
import 'package:top_git_rep/models/search_result_item.dart';

class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

class LanguagesState extends GithubSearchState {

  final List<String> items;

  const LanguagesState({required this.items});

  @override
  List<Object> get props => [items];
}

class RepositoriesState extends GithubSearchState {
  final List<Repository> repository;

  const RepositoriesState({required this.repository});

  @override
  List<Object> get props => [repository];
}

class LoadingState extends GithubSearchState {}


