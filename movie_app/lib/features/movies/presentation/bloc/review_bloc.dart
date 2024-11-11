import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/repository/review_repository.dart';
import 'package:movie_app/features/movies/domain/review.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_event.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewsInitial()) {
    on<ReviewsLoad>(
      (event, emit) async {
        emit(ReviewsLoading());
        try {
          Resource<List<Review>> result =
              await ReviewRepository().getReviews(event.movieId);
          if (result is Success) {
            emit(ReviewsLoaded(reviews: result.data!));
          } else {
            emit(ReviewsError(message: result.message!));
          }
        } catch (e) {
          emit(const ReviewsError(message: 'An unexpected error occurred'));
        }
      },
    );
  }
}
