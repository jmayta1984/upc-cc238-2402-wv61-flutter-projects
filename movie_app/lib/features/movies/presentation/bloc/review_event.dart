abstract class ReviewEvent {
  const ReviewEvent();
}

class ReviewsLoad extends ReviewEvent {
  final int movieId;

  const ReviewsLoad({required this.movieId});
}
