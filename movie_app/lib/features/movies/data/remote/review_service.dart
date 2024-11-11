import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/review_dto.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  Future<Resource<List<ReviewDto>>> getReviews(int movieId) async {
    String url =
        '${AppConstants.baseUrl}${AppConstants.moviePath}/$movieId${AppConstants.reviewsPath}${AppConstants.apiKeyQuery}';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List maps = jsonResponse['results'];
        return Success(maps.map((json) => ReviewDto.fromJson(json)).toList());
      }

      return Error('Error:  ${response.statusCode}');
    } catch (error) {

      return Error('Error:  ${error.toString()}');
    }
  }
}
