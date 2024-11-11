import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/repository/cast_repository.dart';
import 'package:movie_app/features/movies/domain/cast.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_event.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<CastLoad>(
      (event, emit) async {
        emit(CastLoading());
        try {
          Resource<List<Cast>> result =
              await CastRepository().getCast(event.movieId);
          if (result is Success) {
            emit(CastLoaded(cast: result.data!));
          } else {
            emit(CastError(message: result.message!));
          }
        } catch (e) {
          emit(const CastError(message: 'An unexpected error occurred'));
        }
      },
    );
  }
}
