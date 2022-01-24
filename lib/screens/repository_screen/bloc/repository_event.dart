import 'package:equatable/equatable.dart';

abstract class CurrentRepositoryEvent extends Equatable{
  const CurrentRepositoryEvent();

  @override
  List<Object> get props => [];
}

//class CurrentInitEvent extends CurrentRepositoryEvent {}

class GoToCurrentRepositoriesEvent extends CurrentRepositoryEvent{
  const GoToCurrentRepositoriesEvent ({required this.htmlUrl});

  final String htmlUrl;

  @override
  List<Object> get props => [htmlUrl];
}