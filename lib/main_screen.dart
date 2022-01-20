import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/screens/search_screen/bloc/github_search_bloc.dart';
import 'package:top_git_rep/screens/search_screen/bloc/github_search_event.dart';
import 'package:top_git_rep/services/git_api_provider.dart';

import 'screens/search_screen/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final GitProvider gitProvider = GitProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Github Search'),
        ),
        body: BlocProvider(
          create: (_) =>
              GithubSearchBloc(gitProvider: gitProvider)..add(InitEvent()),
          child: const SearchScreen(),
        ),
      ),
    );
  }
}
