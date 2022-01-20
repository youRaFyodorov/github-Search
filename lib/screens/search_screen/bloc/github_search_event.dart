import 'package:equatable/equatable.dart';

abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends GithubSearchEvent {}

class OnTechnologySelectedEvent extends GithubSearchEvent {
  const OnTechnologySelectedEvent({required this.text});

  final String text;

  @override
  List<Object> get props => [text];
}

class GoToCurrentLanguageRepositoriesEvent extends GithubSearchEvent {
  const GoToCurrentLanguageRepositoriesEvent({required this.language});

  final String language;

  @override
  List<Object> get props => [language];
}
