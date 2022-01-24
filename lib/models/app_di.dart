import 'package:get_it/get_it.dart';
import 'package:top_git_rep/services/git_api_provider.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<GithubRepositoryProvider>(GithubRepositoryProvider());

}