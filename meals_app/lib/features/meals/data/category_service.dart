import 'dart:convert';
import 'dart:io';

import 'package:meals_app/features/meals/data/category_dto.dart';
import 'package:meals_app/features/meals/domain/category.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<Category>> getCategories() async {
    String url = 'https://www.themealdb.com/api/json/v1/1/categories.php';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == HttpStatus.ok){
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List maps = jsonResponse['categories'];
        return maps.map((json) => CategoryDto.fromJson(json).toDomain()).toList();
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
