import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/presentation/category_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;

  final List<Widget> _pages =  const [
     CategoryListPage(),
     Placeholder(),
  ];

  final List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant),
      label: 'Meals',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_index]),
      bottomNavigationBar: BottomNavigationBar(items: _items, currentIndex: _index, onTap: (index) {
        setState(() {
          _index = index;
        });
      },),
    );
  }
}