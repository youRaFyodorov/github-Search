import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git_rep/design/app_localization.dart';
import 'package:top_git_rep/design/app_theme_text.dart';
import 'bloc/github_search_bloc.dart';
import 'bloc/github_search_event.dart';
import 'bloc/github_search_state.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      builder: (BuildContext context, GithubSearchState state) {
        if (state is LanguagesState) {
          return Column(
            children: const <Widget>[
              SearchBar(),
              SearchBody(),
            ],
          );
        } else {
          return const Center(
            child: Text(AppLocalization.ERROR_SEARCH_FORM),
          );
        }
      },
    );
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

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void onClearTapped() {
    textController.text = '';
    githubSearchBloc.add(
      const OnTechnologySelectedEvent(text: ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      controller: textController,
      onChanged: (text) {
        githubSearchBloc.add(
          OnTechnologySelectedEvent(text: text),
        );
      },
      decoration: InputDecoration(
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppThemeText.FONTSIZE_22),
        ),
        prefixIcon: const Icon(Icons.search,
            color: Colors.black, size: AppThemeText.ICONSIZE_29),
        suffixIcon: GestureDetector(
          onTap: onClearTapped,
          child: const Icon(Icons.clear,
              color: Colors.black, size: AppThemeText.ICONSIZE_24),
        ),
        border: InputBorder.none,
        hintText: AppLocalization.ENTER_SEARCH_LANGUAGE,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontSize: AppThemeText.FONTSIZE_18,
        ),
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
        if (state is LanguagesState) {
          return state.items.isEmpty
              ? const Text(
                  AppLocalization.NO_RESULT,
                  style: TextStyle(
                    fontSize: AppThemeText.FONTSIZE_18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Expanded(child: SearchResult(items: state.items));
        } else {
          return const Center(
            child: Text(AppLocalization.ERROR_SEARCH_BODY),
          );
        }
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  SearchResult({required this.items});

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
  SearchResultItem({required this.item});

  final String item;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black87,
          textStyle: const TextStyle(
            fontSize: AppThemeText.FONTSIZE_22,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          context
              .read<GithubSearchBloc>()
              .add(GoToCurrentLanguageRepositoriesEvent(language: item));
        },
        child: Text(item));
  }
}

// else if (state is LoadingState) {
// return const SpinKitCircle(
// color: Colors.black87,
// size: Dimensions.SPIN_KIT_CIRCLE_SIZE_80,
// );
// }
