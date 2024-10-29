import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/data/local/character_dao.dart';
import 'package:rick_and_morty/features/character/data/remote/character_service.dart';
import 'package:rick_and_morty/features/character/data/repository/character_repository.dart';
import 'package:rick_and_morty/features/character/presentation/pages/character_list_page.dart';
import 'package:rick_and_morty/features/favorite/presentation/pages/favorite_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = [
    CharacterListPage(
      characterRepository:
          CharacterRepository(characterService: CharacterService(), characterDao: CharacterDao()),
    ),
    const FavoriteListPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
