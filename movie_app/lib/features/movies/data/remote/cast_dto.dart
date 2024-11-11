import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/domain/cast.dart';

class CastDto {
  final int id;
  final String name;
  final String profilePath;
  final String character;

  CastDto({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory CastDto.fromJson(Map<String, dynamic> json) {
    return CastDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      profilePath: json['profile_path'] ?? '',
      character: json['character'] ?? '',
    );
  }

  Cast toCast() {
    return Cast(
      name: name,
      profilePath: AppConstants.imageBaseUrl + profilePath,
      character: character,
    );
  }
}
