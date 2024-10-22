import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/data/remote/character_model.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem({super.key, required this.characterModel});
  final CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(characterModel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
            ),
          ),
          Row(
             children: [
              Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                child: ClipOval(
                  child: Hero(
                    tag: characterModel.id,
                    child: Image.network(
                      characterModel.image,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Species: ${characterModel.species}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Status: ${characterModel.status}'),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
