import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/domain/review.dart';

class ReviewDto {
  final String id;
  final String author;
  final String content;
  final AuthorDetails authorDetails;

  ReviewDto({
    required this.id,
    required this.author,
    required this.content,
    required this.authorDetails,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return ReviewDto(
        id: json['id'] ?? 0,
        author: json['author'] ?? '',
        content: json['content'] ?? '',
        authorDetails: AuthorDetails.fromJson(json['author_details']));
  }

  Review toReview() {
    return Review(
        author: author,
        content: content,
        avatarPath: AppConstants.imageBaseUrl + authorDetails.avatarPath,
        rating: authorDetails.rating);
  }
}

class AuthorDetails {
  final String name;
  final String username;
  final String avatarPath;
  final double rating;

  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      avatarPath: json['avatar_path'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}
