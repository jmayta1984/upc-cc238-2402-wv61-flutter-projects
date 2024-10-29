import 'package:rick_and_morty/features/character/data/remote/character_model.dart';
import 'package:rick_and_morty/features/character/domain/character.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class CharacterMapper {
  static Character toCharacter(CharacterModel characterModel) {
    return Character(
        id: characterModel.id,
        name: characterModel.name,
        image: characterModel.image,
        status: characterModel.status,
        species: characterModel.species,
        gender: characterModel.gender);
  }

  static FavoriteModel toFavoriteModel(Character character) {
    return FavoriteModel(
        id: character.id,
        name: character.name,
        status: character.status,
        species: character.species,
        image: character.image);
  }
}
