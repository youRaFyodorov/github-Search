import 'package:equatable/equatable.dart';

abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends GithubSearchEvent {}

class OnTechnologySelected extends GithubSearchEvent {
  const OnTechnologySelected({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

class GoToCurrentLanguageRepositories extends GithubSearchEvent {
  const GoToCurrentLanguageRepositories({required this.language});

  final String language;

  @override
  List<Object> get props => [language];
}


