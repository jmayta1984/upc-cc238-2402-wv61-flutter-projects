import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/data/category_service.dart';
import 'package:meals_app/features/meals/domain/category.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> _categories = [];

  Future<void> _loadData() async {
    List<Category> categories = await CategoryService().getCategories();
    setState(() {
      _categories = categories;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _categories.length,
      itemBuilder: (context, index) => Card(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(_categories[index].image),
          Text(_categories[index].name),
        ],
      )),
    );
  }
}
