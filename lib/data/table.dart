
class RepositoryTable {
  static const String TABLE_NAME = 'repository';
  static const String COLUMN_ID_REPOSITORY = 'id';
  static const String COLUMN_ID_LANGUAGE = 'id_language';
  static const String COLUMN_FULL_NAME = 'full_name';
  static const String COLUMN_DESCRIPTION = 'description';
  static const String COLUMN_STARGAZERS_COUNT = 'stargazers_count';

  static const String CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME (
      $COLUMN_ID_REPOSITORY TEXT PRIMARY KEY,
      $COLUMN_ID_LANGUAGE INTEGER NOT NULL,
      $COLUMN_FULL_NAME TEXT NOT NULL,
      $COLUMN_DESCRIPTION TEXT, 
      $COLUMN_STARGAZERS_COUNT INTEGER NOT NULL, 
      FOREIGN KEY ($COLUMN_ID_LANGUAGE) 
      REFERENCES ${RepositoryTable.TABLE_NAME}(${RepositoryTable.COLUMN_ID_REPOSITORY}) 
      ON DELETE CASCADE
      )
      ''';
}

class LanguageTable {
  static const String TABLE_NAME = 'language';
  static const String COLUMN_ID_LANGUAGE = 'id';
  static const String COLUMN_NAME = 'name';

  static const String CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME (
      $COLUMN_ID_LANGUAGE INTEGER PRIMARY KEY,
      $COLUMN_NAME TEXT NOT NULL,
      REFERENCES ${LanguageTable.TABLE_NAME}(${LanguageTable.COLUMN_ID_LANGUAGE}) 
      ON DELETE CASCADE
      )
      ''';
}

class FavoriteLanguageTable {
  static const String TABLE_NAME = 'favoriteLanguage';
  static const String COLUMN_ID_FAVORITE_LANGUAGE = 'id';
  static const String COLUMN_ID_LANGUAGE = 'id';

  static const String CREATE_TABLE_QUERY = '''
      CREATE TABLE $TABLE_NAME (
      $COLUMN_ID_FAVORITE_LANGUAGE INTEGER PRIMARY KEY,
      $COLUMN_ID_LANGUAGE INTEGER NOT NULL,
      FOREIGN KEY ($COLUMN_ID_LANGUAGE) 
      REFERENCES ${FavoriteLanguageTable.TABLE_NAME}(${FavoriteLanguageTable.COLUMN_ID_LANGUAGE}) 
      ON DELETE CASCADE
      )
      ''';
}