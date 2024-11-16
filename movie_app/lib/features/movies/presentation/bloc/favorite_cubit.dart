import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/shared/data/local/favorite_dao.dart';
import 'package:movie_app/shared/data/local/favorite_model.dart';

class FavoriteCubit extends Cubit<Movie> {
  FavoriteCubit(super.movie) {
    FavoriteDao().isFavorite(state.id).then((value) {
      emit(Movie(
          id: state.id,
          title: state.title,
          overview: state.overview,
          releaseDate: state.releaseDate,
          posterPath: state.posterPath,
          backdropPath: state.backdropPath,
          voteAverage: state.voteAverage,
          isFavorite: value));
    });
  }

  void toggleFavorite() {
    bool isFavorite = !state.isFavorite;
    isFavorite
        ? FavoriteDao().insert(FavoriteModel(
            id: state.id,
            title: state.title,
            overview: state.overview,
            releaseDate: state.releaseDate,
            posterPath: state.posterPath))
        : FavoriteDao().delete(state.id);
    emit(
      Movie(
          id: state.id,
          title: state.title,
          overview: state.overview,
          releaseDate: state.releaseDate,
          posterPath: state.posterPath,
          backdropPath: state.backdropPath,
          voteAverage: state.voteAverage,
          isFavorite: isFavorite),
    );
  }
}
