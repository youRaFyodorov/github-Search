import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/screens/repository_screen/repository_screen.dart';

import 'bloc/github_search_bloc.dart';
import 'bloc/github_search_event.dart';
import 'bloc/github_search_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GithubSearchBloc, GithubSearchState>(
        listener: (context, state) {
      if (state is StateWithRepositories) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => RepositoryScreen(
                      repository: state.repository,
                    )));
      }
    }, builder: (BuildContext context, GithubSearchState state) {
      if (state is StateWithLanguages) {
        return Column(
          children: const <Widget>[
            SearchBar(),
            SearchBody(),
          ],
        );
      } else {
        return const Center(
          child: Text('Error SearchForm'),
        );
      }
    });
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();
  late GithubSearchBloc githubSearchBloc;

  @override
  void initState() {
    super.initState();
    githubSearchBloc = context.read<GithubSearchBloc>();
  }

  //@override
  void despose() {
    textController.dispose();
    super.dispose();
  }

  void onClearTapped() {
    textController.text = '';
    githubSearchBloc.add(const OnTechnologySelected(text: ''));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: textController,
      onChanged: (text) {
        githubSearchBloc.add(
          OnTechnologySelected(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: onClearTapped,
          child: const Icon(Icons.clear),
        ),
        border: InputBorder.none,
        hintText: 'Enter a search language',
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
        builder: (context, state) {
      if (state is StateWithLanguages) {
        return state.items.isEmpty
            ? const Text('No result')
            : Expanded(child: SearchResult(items: state.items));
      } else {
        return const Center(
          child: Text('Error SearchBody'),
        );
      }
    });
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.items}) : super(key: key);
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SearchResultItem(item: items[index]);
      },
    );
  }
}

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({Key? key, required this.item}) : super(key: key);
  final String item;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Colors.black87,
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            )
            //fixedSize:
            ),
        onPressed: () {
          context
              .read<GithubSearchBloc>()
              .add(GoToCurrentLanguageRepositories(language: item));
        },
        child: Text(item));
  }
}
