/*
{
      "idCategory": "1",
      "strCategory": "Beef",
      "strCategoryThumb": "https://www.themealdb.com/images/category/beef.png",
      "strCategoryDescription": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
    }
*/
import 'package:meals_app/features/meals/domain/category.dart';

class CategoryDto {
  final String id;
  final String name;
  final String image;
  final String description;

  const CategoryDto({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) {
    return CategoryDto(
      id: json['idCategory'] ?? '',
      name: json['strCategory'] ?? '',
      image: json['strCategoryThumb'] ?? '',
      description: json['strCategoryDescription'] ?? '',
    );
  }

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      image: image,
      description: description,
    );
  }
}
