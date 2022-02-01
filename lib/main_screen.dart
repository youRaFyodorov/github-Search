import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/design/app_localization.dart';
import 'package:top_git_rep/navigation/router.dart';
import 'package:top_git_rep/screens/search_screen/bloc/github_search_bloc.dart';
import 'package:top_git_rep/screens/search_screen/bloc/github_search_event.dart';
import 'package:top_git_rep/services/git_api_provider.dart';
import 'models/app_di.dart';
import 'screens/search_screen/search_screen.dart';

class MainPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute<void>(
        builder: (_) => MainScreen(), settings: this);
  }
}

class MainScreen extends StatelessWidget {
  final GithubRepositoryProvider gitProvider =
      getIt<GithubRepositoryProvider>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalization.TITLE,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(AppLocalization.TITLE),
          backgroundColor: Colors.black87,
        ),
        body: BlocProvider(
          create: (_) => GithubSearchBloc(
              gitProvider: getIt.get<GithubRepositoryProvider>(),
              appRouter: getIt.get<AppRouter>())
            ..add(InitEvent()),
          child: SearchScreen(),
        ),
      ),
    );
  }
}
