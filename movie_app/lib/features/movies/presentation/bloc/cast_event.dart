abstract class CastEvent {
  const CastEvent();
}

class CastLoad extends CastEvent {
  final int movieId;

  const CastLoad({required this.movieId});
}