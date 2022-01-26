import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:top_git_rep/data/table.dart';

import 'db_storage_factory.dart';

class DbStorageFactoryImpl extends DbStorageFactory {
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = 'language.db';

  final Database db;

  DbStorageFactoryImpl._(this.db);

  @override
  Future<DbStorageFactory> createInstance() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, DATABASE_NAME);

    final Database db = await openDatabase(
      path,
      version: DATABASE_VERSION,
      onUpgrade: (Database db, int oldVersion, int newVersion) async {},
      onCreate: (Database db, int version) async {
        await db.execute(RepositoryTable.CREATE_TABLE_QUERY);
        await db.execute(LanguageTable.CREATE_TABLE_QUERY);
        await db.execute(FavoriteLanguageTable.CREATE_TABLE_QUERY);
      },
      onConfigure: (Database db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
    return DbStorageFactoryImpl._(db);
  }
}
