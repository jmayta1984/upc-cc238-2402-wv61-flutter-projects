import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/favorite/presentation/widgets/favorite_list_item.dart';
import 'package:rick_and_morty/shared/data/local/favorite_dao.dart';
import 'package:rick_and_morty/shared/data/local/favorite_model.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  List<FavoriteModel> _favorites = [];

  Future<void> _loadData() async {
    final List<FavoriteModel> favorites = await FavoriteDao().getAllFavorites();
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
      itemBuilder: (context, index) {
        return FavoriteListItem(
            favoriteModel: _favorites[index],
            onDelete: () {
              FavoriteDao().deleteFavorite(_favorites[index].id);
              _loadData();
            });
      },
    );
  }
}
