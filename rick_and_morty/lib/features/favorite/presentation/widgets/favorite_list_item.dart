import 'package:flutter/material.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, required this.favoriteModel, required this.onDelete});
  final FavoriteModel favoriteModel;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  favoriteModel.image,
                  width: 96,
                  height: 96,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favoriteModel.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(favoriteModel.status),
            ],
          ),
          const Spacer(),
          IconButton.outlined(onPressed: () {
           onDelete();     
          }, icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
