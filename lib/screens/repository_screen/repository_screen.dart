import 'package:flutter/material.dart';
import 'package:top_git_rep/models/search_result_item.dart';

class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({Key? key, required this.repository})
      : super(key: key);

  final List<Repository> repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Repositories'),
            leading: GestureDetector(
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // context.read<GithubSearchBloc>().add(InitEvent());
                  Navigator.pop(context);
                },
              ),
            )),
        // ),
        body: ListView.builder(
            itemCount: repository.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: GestureDetector(
                  onTap: () {}, //goToCurrentRepository
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        repository[index].fullName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(repository[index].description),
                      Row(children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.star_border)),
                        Text('${repository[index].stargazersCount}')
                      ]),
                      const Divider(
                        thickness: 2,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
