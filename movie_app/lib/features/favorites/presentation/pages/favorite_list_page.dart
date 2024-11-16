import 'package:flutter/material.dart';
import 'package:movie_app/features/favorites/presentation/pages/favorite_list_item.dart';
import 'package:movie_app/shared/data/local/favorite_dao.dart';
import 'package:movie_app/shared/data/local/favorite_model.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  List<FavoriteModel> _favorites = [];

  Future<void> _loadData() async {
    List<FavoriteModel> favorites = await FavoriteDao().fetchAll();
    setState(() {
      _favorites = favorites;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favorites.length,
      itemBuilder: (context, index) => FavoriteListItem(
          favorite: _favorites[index],
          onDelete: () {
            FavoriteDao().delete(_favorites[index].id);
            _loadData();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites'),
              ),
            );
          }),
    );
  }
}
