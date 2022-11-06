import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/cast_entity.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetCastUseCase {
  final MovieRepository movieRepository;
  GetCastUseCase(this.movieRepository);

  Future<Either<Failure, List<CastEntity>>> call(int id) async {
    return await movieRepository.getCastCrew(id);
  }
}
