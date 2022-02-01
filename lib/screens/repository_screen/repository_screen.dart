import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/design/app_localization.dart';
import 'package:top_git_rep/design/app_theme_text.dart';
import 'package:top_git_rep/design/dimensions.dart';
import 'package:top_git_rep/models/app_di.dart';
import 'package:top_git_rep/models/search_result_item.dart';
import 'package:top_git_rep/navigation/router.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_bloc.dart';
import 'package:top_git_rep/screens/repository_screen/bloc/repository_state.dart';
import 'package:top_git_rep/services/favorite_repository_provider.dart';

import 'bloc/repository_event.dart';

class RepositoryPage extends Page<void> {
  RepositoryPage({required this.repository});

  final List<Repository> repository;

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
        builder: (BuildContext context) => RepositoryScreen(
              repository: repository,
            ),
        settings: this);
  }
}

class RepositoryScreen extends StatelessWidget {
  RepositoryScreen({required this.repository});

  final List<Repository> repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentRepositoryBloc(
          repositoryProvider: getIt.get<FavoriteRepositoryProvider>(),
          appRouter: getIt.get<AppRouter>())
        ..add(InitEvent(repository: repository)),
      child: BlocBuilder<CurrentRepositoryBloc, CurrentRepositoryState>(
        builder: (BuildContext context, CurrentRepositoryState state) {
          final List<Repository>? listRepository = state.listRepository;
          final List<bool>? isFavoriteRepository = state.isFavoriteRepository;
          if (listRepository == null || isFavoriteRepository == null) {
            return const CircularProgressIndicator(color: Colors.black);
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text(AppLocalization.REPOSITORIES),
                backgroundColor: Colors.black87,
                leading: GestureDetector(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.read<CurrentRepositoryBloc>().add(Pop());
                    },
                  ),
                ),
              ),
              body: ListView.builder(
                itemCount: listRepository.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(Dimensions.PADDING_3),
                    child: GestureDetector(
                      onTap: () {
                        context.read<CurrentRepositoryBloc>().add(
                            GoToCurrentRepositoriesEvent(
                                htmlUrl: listRepository[index].htmlUrl));
                      },
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      listRepository[index].fullName,
                                      style: const TextStyle(
                                        fontSize: AppThemeText.FONTSIZE_16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(listRepository[index].description),
                                    Row(
                                      children: <Widget>[
                                        const Padding(
                                            padding: EdgeInsets.only(
                                              right: Dimensions.PADDING_10,
                                            ),
                                            child: Icon(
                                              Icons.star_border,
                                            )),
                                        Text(
                                          '${listRepository[index].stargazersCount}',
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (isFavoriteRepository[index]) {
                                    context.read<CurrentRepositoryBloc>().add(
                                        DeleteFromFavoriteRepositoryEvent(
                                            index: index));
                                  } else {
                                    context.read<CurrentRepositoryBloc>().add(
                                        SaveAsFavoriteRepositoryEvent(
                                            index: index));
                                  }
                                },
                                icon: isFavoriteRepository[index]
                                    ? const Icon(Icons.favorite,
                                        color: Colors.purpleAccent)
                                    : const Icon(Icons.favorite_border),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: Dimensions.DIVIDER_THICKNESS_2,
                            height: Dimensions.DIVIDER_HEIGHT_10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
