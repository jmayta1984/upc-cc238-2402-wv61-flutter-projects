import 'package:flutter/material.dart';
import 'package:movie_app/shared/data/local/favorite_model.dart';

class FavoriteListItem extends StatelessWidget {
  const FavoriteListItem({super.key, required this.favorite, required this.onDelete});
  final FavoriteModel favorite;
  final void Function()  onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipOval(
          child: Image.network(
            favorite.posterPath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          favorite.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(favorite.overview,
            maxLines: 2, softWrap: false, overflow: TextOverflow.ellipsis),
            trailing: IconButton(
              onPressed: () {
                onDelete();
              },
              icon: const Icon(Icons.delete),
            ),
      ),
    );
  }
}
