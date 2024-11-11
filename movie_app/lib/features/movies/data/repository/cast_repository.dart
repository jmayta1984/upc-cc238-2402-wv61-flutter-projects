import 'package:movie_app/core/resource.dart';
import 'package:movie_app/features/movies/data/remote/cast_dto.dart';
import 'package:movie_app/features/movies/data/remote/cast_service.dart';
import 'package:movie_app/features/movies/domain/cast.dart';

class CastRepository {
  Future<Resource<List<Cast>>> getCast(int movieId) async {
    Resource<List<CastDto>> result = await CastService().getCast(movieId);

    if (result is Success) {
      return Success(result.data!.map((castDto) => castDto.toCast()).toList());
    } else {
      return Error(result.message!);
    }
  }
}
