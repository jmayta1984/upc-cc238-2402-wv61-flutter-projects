import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/cast_dto.dart';
import 'package:http/http.dart' as http;

class CastService {
  Future<Resource<List<CastDto>>> getCast(int movieId) async {
    String url =
        '${AppConstants.baseUrl}${AppConstants.moviePath}/$movieId${AppConstants.creditsPath}${AppConstants.apiKeyQuery}';
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List maps = jsonResponse['cast'];
        return Success(maps.map((json) => CastDto.fromJson(json)).toList());
       }
      return Error('Error:  ${response.statusCode}');
    } catch (error) {
      return Error('Error:  ${error.toString()}');
    }
  }
}
