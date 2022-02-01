import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/models/search_result_item.dart';
import 'package:top_git_rep/navigation/router.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_event.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_state.dart';
import 'package:top_git_rep/services/favorite_repository_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentRepositoryBloc
    extends Bloc<CurrentRepositoryEvent, CurrentRepositoryState> {
  CurrentRepositoryBloc({required this.repositoryProvider, required this.appRouter})
      : super(CurrentRepositoryState());

  final FavoriteRepositoryProvider repositoryProvider;
  final AppRouter appRouter;

  @override
  Stream<CurrentRepositoryState> mapEventToState(
      CurrentRepositoryEvent event) async* {
    if (event is InitEvent) {
      final List<dynamic> favoriteRepositoriesID =
          await repositoryProvider.getAll();
      final List<bool> isFavoriteRepository =
          event.repository.map((Repository repository) {
        if (favoriteRepositoriesID.contains(repository.id)) {
          return true;
        } else {
          return false;
        }
      }).toList();
      print(isFavoriteRepository);
      yield CurrentRepositoryState(
          listRepository: event.repository,
          isFavoriteRepository: isFavoriteRepository);
    } else if (event is GoToCurrentRepositoriesEvent) {
      if (await canLaunch(event.htmlUrl)) {
        await launch(event.htmlUrl);
      }
    } else if (event is SaveAsFavoriteRepositoryEvent) {
      await repositoryProvider.save(state.listRepository![event.index].id);
      List<bool> newIsFavoriteRepository = [];
      state.isFavoriteRepository!.forEach(
        (bool isFavorite) {
          newIsFavoriteRepository.add(isFavorite);
        },
      );
      newIsFavoriteRepository[event.index] = true;
      yield state.copyWith(isFavoriteRepository: newIsFavoriteRepository);
    } else if (event is DeleteFromFavoriteRepositoryEvent) {
      await repositoryProvider.delete(state.listRepository![event.index].id);
      List<bool> newIsFavoriteRepository = [];
      state.isFavoriteRepository!.forEach(
        (bool isFavorite) {
          newIsFavoriteRepository.add(isFavorite);
        },
      );
      newIsFavoriteRepository[event.index] = false;
      yield state.copyWith(isFavoriteRepository: newIsFavoriteRepository);
      print('delete element');
    } else if(event is Pop){
      appRouter.pop();
    }
  }
}
