import 'package:movie_app/features/movies/domain/review.dart';

abstract class ReviewState {
  const ReviewState();
}

class ReviewsInitial extends ReviewState {}

class ReviewsLoading extends ReviewState {}

class ReviewsLoaded extends ReviewState {
  final List<Review> reviews;

  const ReviewsLoaded({required this.reviews});
}

class ReviewsError extends ReviewState {
  final String message;

  const ReviewsError({required this.message});
}
