import 'package:sqflite/sqflite.dart';
import 'package:top_git_rep/data/table.dart';

class FavoriteRepositoryProvider {
  final Database db;

  FavoriteRepositoryProvider({required this.db});

  Future<void> save(int repositoryId) async {
    {
      await db.insert(FavoriteRepositoryTable.TABLE_NAME, {
        FavoriteRepositoryTable.COLUMN_ID_FAVORITE_REPOSITORY: repositoryId
      });
      print('save element in Provider');
    }
  }

  Future<List<dynamic>> getAll() async {
    Database db = this.db;
    final List<Map<String, Object?>> resultFromDb = await db.query(
        FavoriteRepositoryTable.TABLE_NAME,
        columns: [FavoriteRepositoryTable.COLUMN_ID_FAVORITE_REPOSITORY]);
    print('result $resultFromDb');
    return resultFromDb
        .map((Map repositoryMap) => repositoryMap[
            FavoriteRepositoryTable.COLUMN_ID_FAVORITE_REPOSITORY])
        .toList();
  }

  Future<void> delete(int repositoryId) async {
    {
      await db.delete(FavoriteRepositoryTable.TABLE_NAME,
          where: '${FavoriteRepositoryTable.COLUMN_ID_FAVORITE_REPOSITORY} = ?',
          whereArgs: [repositoryId]);
      print('delete element in Provider');
    }
  }
}
