import 'package:sqflite/sqflite.dart';
import 'package:top_git_rep/data/table.dart';

class LanguageProvider {
  final Database db;

  static const List<String> languages = [
    'java',
    'swift',
    'dart',
    'c#',
    'javaScript',
    'c',
    'c++',
    'kotlin',
    'ruby',
    'go',
    'fortran',
    'typeScript',
    'flutter'
  ];

  LanguageProvider({required this.db});

  Future<void> saveAll(List<String> languageNames) async {
    languageNames.forEach((languageName) async {
      await db.insert(LanguageTable.TABLE_NAME,
          <String, String>{LanguageTable.COLUMN_NAME: languageName});
    });
  }

  Future<List<String>> getAll() async {
    return (await db.query(LanguageTable.TABLE_NAME))
        .map((languageMap) => languageMap[LanguageTable.COLUMN_NAME] as String)
        .toList();
  }

  Future<void> init() {
    return saveAll(languages);
  }
}
