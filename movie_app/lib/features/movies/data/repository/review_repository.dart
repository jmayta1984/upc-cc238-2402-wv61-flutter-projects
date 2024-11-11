import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/review_dto.dart';
import 'package:movie_app/features/movies/data/remote/review_service.dart';

import 'package:movie_app/features/movies/domain/review.dart';

class ReviewRepository {
  Future<Resource<List<Review>>> getReviews(int movieId) async {
    Resource<List<ReviewDto>> result =
        await ReviewService().getReviews(movieId);

    if (result is Success) {
      return Success(
          result.data!.map((reviewDto) => reviewDto.toReview()).toList());
    } else {
      return Error(result.message!);
    }
  }
}
