
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:top_git_rep/data/table.dart';
import 'package:top_git_rep/models/app_di.dart';
import 'package:top_git_rep/services/favorite_repository_provider.dart';
import 'package:top_git_rep/services/language_provider.dart';

import 'db_storage_factory.dart';

class DbStorageFactoryImpl extends DbStorageFactory {
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = 'language.db';

  final Database db;


  DbStorageFactoryImpl._(this.db);

  static Future<DbStorageFactory> createInstance() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, DATABASE_NAME);

    final Database db = await openDatabase(
      path,
      version: DATABASE_VERSION,
      onUpgrade: (Database db, int oldVersion, int newVersion) async {},
      onCreate: (Database db, int version) async {
        await db.execute(LanguageTable.CREATE_TABLE_QUERY);
        await LanguageProvider(db: db).init();
        await db.execute(FavoriteRepositoryTable.CREATE_TABLE_QUERY);
        print('db created');
        //await FavoriteRepositoryProvider(db: db).save();
        //await db.execute(FavoriteRepositoryTable.CREATE_TABLE_SELECT);
      },
      // onConfigure: (Database db) async {
      //   await db.execute('PRAGMA foreign_keys = ON');
      // },
    );

    getIt.registerSingleton<FavoriteRepositoryProvider>(FavoriteRepositoryProvider(db: db));

    return DbStorageFactoryImpl._(db);
  }


}
