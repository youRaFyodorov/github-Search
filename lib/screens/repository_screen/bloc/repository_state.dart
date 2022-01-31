import 'package:equatable/equatable.dart';
import 'package:top_git_rep/models/search_result_item.dart';

// abstract class CurrentRepositoryState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

class CurrentRepositoryState extends Equatable {
  final List<Repository>? listRepository;

  final List<bool>? isFavoriteRepository;

  const CurrentRepositoryState(
      {this.listRepository, this.isFavoriteRepository});

  CurrentRepositoryState copyWith({
    List<bool>? isFavoriteRepository,
    List<Repository>? listRepository,
  }) =>
      CurrentRepositoryState(isFavoriteRepository: isFavoriteRepository ??
          this.isFavoriteRepository,
          listRepository: listRepository ?? this.listRepository);

  @override
  List<Object?> get props => [listRepository, isFavoriteRepository];
}

//class LoadingState extends CurrentRepositoryState {}

// class SaveAsFavoriteRepositoryState extends CurrentRepositoryState{
//   SaveAsFavoriteRepositoryState() : super(listRepository: listRepository);
// }
//
// class DeleteFromFavoriteRepositoryState extends CurrentRepositoryState{
//   DeleteFromFavoriteRepositoryState() : super(listRepository: );
// }
