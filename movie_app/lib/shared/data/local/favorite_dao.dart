import 'package:movie_app/shared/data/local/app_database.dart';
import 'package:movie_app/shared/data/local/favorite_model.dart';

class FavoriteDao {
  final AppDatabase _appDatabase = AppDatabase();

  Future<List<FavoriteModel>> fetchAll() async {
    final db = await _appDatabase.openDb();
    final List maps = await db.query(_appDatabase.favoriteTable);
    return maps.map((map) => FavoriteModel.fromMap(map)).toList();
  }

  Future<void> insert(FavoriteModel favoriteModel) async {
    final db = await _appDatabase.openDb();
    await db.insert(
      _appDatabase.favoriteTable,
      favoriteModel.toMap(),
    );
  }

  Future<void> delete(int id) async {
    final db = await _appDatabase.openDb();
    await db.delete(
      _appDatabase.favoriteTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> isFavorite(int id) async {
    final db = await _appDatabase.openDb();
    final List maps = await db.query(
      _appDatabase.favoriteTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }
}
