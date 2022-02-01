import 'package:equatable/equatable.dart';
import 'package:top_git_rep/models/search_result_item.dart';

abstract class CurrentRepositoryEvent extends Equatable {
  const CurrentRepositoryEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends CurrentRepositoryEvent {
  const InitEvent({required this.repository});

  final List<Repository> repository;
}

class GoToCurrentRepositoriesEvent extends CurrentRepositoryEvent {
  const GoToCurrentRepositoriesEvent({required this.htmlUrl});

  final String htmlUrl;

  @override
  List<Object> get props => [htmlUrl];
}

class Pop extends CurrentRepositoryEvent {}

class SaveAsFavoriteRepositoryEvent extends CurrentRepositoryEvent {
  const SaveAsFavoriteRepositoryEvent({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}

class DeleteFromFavoriteRepositoryEvent extends CurrentRepositoryEvent {
  const DeleteFromFavoriteRepositoryEvent({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}
