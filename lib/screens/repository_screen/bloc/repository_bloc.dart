import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_event.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_state.dart';
import 'package:top_git_rep/screens/search_screen/bloc/github_search_state.dart';
import 'package:top_git_rep/services/git_api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentRepositoryBloc extends Bloc<CurrentRepositoryEvent, CurrentRepositoryState>{
  CurrentRepositoryBloc() : super(CurrentRepositoryState());

  @override
  Stream<CurrentRepositoryState> mapEventToState(CurrentRepositoryEvent event) async* {
    if (event is GoToCurrentRepositoriesEvent) {
      if (await canLaunch(event.htmlUrl)) {
        await launch(event.htmlUrl);
      }
    }
  }
}