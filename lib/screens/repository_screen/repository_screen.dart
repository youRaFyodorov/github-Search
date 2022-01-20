import 'package:flutter/material.dart';
import 'package:top_git_rep/design/app_localization.dart';
import 'package:top_git_rep/design/app_theme_text.dart';
import 'package:top_git_rep/design/dimensions.dart';
import 'package:top_git_rep/models/search_result_item.dart';

class RepositoryScreen extends StatelessWidget {
  RepositoryScreen({required this.repository});

  final List<Repository> repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(AppLocalization.REPOSITORIES),
          leading: GestureDetector(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )),
      // ),
      body: ListView.builder(
        itemCount: repository.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_3),
            child: GestureDetector(
              onTap: () {}, //goToCurrentRepository
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    repository[index].fullName,
                    style: const TextStyle(
                      fontSize: AppThemeText.FONTSIZE_16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(repository[index].description),
                  Row(children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                          right: Dimensions.PADDING_10,
                        ),
                        child: Icon(
                          Icons.star_border,
                        )),
                    Text(
                      '${repository[index].stargazersCount}',
                    )
                  ]),
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
}
