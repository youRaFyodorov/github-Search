import 'package:equatable/equatable.dart';
import 'package:top_git_rep/models/search_result_item.dart';

class CurrentRepositoryState extends Equatable {
  final List<Repository>? listRepository;

  final List<bool>? isFavoriteRepository;

  const CurrentRepositoryState(
      {this.listRepository, this.isFavoriteRepository});

  CurrentRepositoryState copyWith({
    List<bool>? isFavoriteRepository,
    List<Repository>? listRepository,
  }) {
    return CurrentRepositoryState(
        isFavoriteRepository: isFavoriteRepository ?? this.isFavoriteRepository,
        listRepository: listRepository ?? this.listRepository);
  }

  @override
  List<Object?> get props => [listRepository, isFavoriteRepository];
}
