import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  final int version = 1;
  final String databaseName = 'movie_database.db';
  final String favoriteTable = 'favorites';

  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: version,
      onCreate: (db, version) async {
        String query =
            ' CREATE TABLE $favoriteTable ( id INTEGER PRIMARY KEY, title TEXT, overview TEXT, release_date TEXT, poster_path TEXT)';
        await db.execute(query);
      },
    );
    return _db as Database;
  }
}
