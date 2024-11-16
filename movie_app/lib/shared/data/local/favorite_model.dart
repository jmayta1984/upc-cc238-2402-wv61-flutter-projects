class FavoriteModel {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;

  const FavoriteModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'poster_path': posterPath,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
        id: map['id'] ?? 0,
        title: map['title'] ?? '',
        overview: map['overview'] ?? '',
        releaseDate: map['release_date'] ?? '',
        posterPath: map['poster_path'] ?? '');
  }
}
