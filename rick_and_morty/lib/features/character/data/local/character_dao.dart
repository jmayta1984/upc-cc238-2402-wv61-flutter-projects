import 'package:rick_and_morty/features/character/data/remote/character_mapper.dart';
import 'package:rick_and_morty/features/character/domain/character.dart';
import 'package:rick_and_morty/shared/data/local/favorite_dao.dart';

class CharacterDao {
  Future<bool> isFavorite(int id) async {
    return await FavoriteDao().isFavorite(id);
  }

  Future<void> insert(Character character) async {
    await FavoriteDao()
        .insertFavorite(CharacterMapper.toFavoriteModel(character));
  }

  Future<void> delete(int id) async {
    await FavoriteDao().deleteFavorite(id);
  }
}
