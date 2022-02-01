class LanguageTable {
  static const String TABLE_NAME = 'language';
  static const String COLUMN_ID_LANGUAGE = 'id_language';
  static const String COLUMN_NAME = 'name';

  static const String CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME (
      $COLUMN_ID_LANGUAGE INTEGER PRIMARY KEY,
      $COLUMN_NAME TEXT NOT NULL
      )
      ''';
}

class FavoriteRepositoryTable {
  static const String TABLE_NAME = 'favoriteRepository';
  static const String COLUMN_ID_FAVORITE_REPOSITORY = 'id';

  static const String CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME (
      $COLUMN_ID_FAVORITE_REPOSITORY INTEGER PRIMARY KEY
      )
      ''';
}

// class RepositoryTable {
//   static const String TABLE_NAME = 'repository';
//   static const String COLUMN_ID_REPOSITORY = 'id_repository';
//   static const String COLUMN_ID_LANGUAGE = 'id_language';
//   static const String COLUMN_FULL_NAME = 'full_name';
//   static const String COLUMN_DESCRIPTION = 'description';
//   static const String COLUMN_STARGAZERS_COUNT = 'stargazers_count';
//
//   static const String CREATE_TABLE_QUERY = '''
//       CREATE TABLE $TABLE_NAME (
//       $COLUMN_ID_REPOSITORY TEXT PRIMARY KEY,
//       $COLUMN_ID_LANGUAGE INTEGER NOT NULL,
//       $COLUMN_FULL_NAME TEXT NOT NULL,
//       $COLUMN_DESCRIPTION TEXT,
//       $COLUMN_STARGAZERS_COUNT INTEGER NOT NULL,
//       FOREIGN KEY ($COLUMN_ID_LANGUAGE)
//       REFERENCES ${RepositoryTable.TABLE_NAME}(${RepositoryTable.COLUMN_ID_REPOSITORY})
//       ON DELETE CASCADE
//       )
//       ''';
// }
