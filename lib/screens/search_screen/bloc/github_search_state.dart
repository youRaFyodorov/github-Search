import 'package:equatable/equatable.dart';
import 'package:top_git_rep/models/search_result_item.dart';

class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

class StateWithLanguages extends GithubSearchState {
  final List<String> items;

  const StateWithLanguages({required this.items});

  @override
  List<Object> get props => [items];
}

class StateWithRepositories extends GithubSearchState {
  final List<Repository> repository;

  const StateWithRepositories({required this.repository});

  @override
  List<Object> get props => [repository];
}
