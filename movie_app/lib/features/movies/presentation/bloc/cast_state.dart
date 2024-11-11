import 'package:movie_app/features/movies/domain/cast.dart';

abstract class CastState {
  const CastState();
}

class CastInitial extends CastState {
}

class CastLoading extends CastState {
}

class CastLoaded extends CastState {
  final List<Cast> cast;

  const CastLoaded({required this.cast});
}

class CastError extends CastState {
  final String message;

  const CastError({required this.message});
}