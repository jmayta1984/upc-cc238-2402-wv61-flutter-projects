import 'package:rick_and_morty/features/character/data/local/character_dao.dart';
import 'package:rick_and_morty/features/character/data/remote/character_mapper.dart';
import 'package:rick_and_morty/features/character/data/remote/character_model.dart';
import 'package:rick_and_morty/features/character/data/remote/character_service.dart';
import 'package:rick_and_morty/features/character/domain/character.dart';

class CharacterRepository {
  final CharacterService characterService;
  final CharacterDao characterDao;
  CharacterRepository({
    required this.characterService,
    required this.characterDao,
  });

  Future<List<Character>> getCharacters(int page) async {
    List<CharacterModel> charactersModel =
        await characterService.getCharacters(page);

    List<Character> characters = charactersModel.map((characterModel) {
      Character character = CharacterMapper.toCharacter(characterModel);
      characterDao.isFavorite(characterModel.id).then(
        (value) {
          character.isFavorite = value;
        },
      );
      return character;
    }).toList();

    return characters;
  }

  Future<void> insert(Character character) async {
    await characterDao.insert(character);
  }

  Future<void> delete(int id) async {
    await characterDao.delete(id);
  }
}
