class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final bool isFavorite;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.posterPath,
      required this.backdropPath,
      required this.voteAverage,
      required this.isFavorite});
}
