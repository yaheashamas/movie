import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetPopularUseCase {
  MovieRepository movieRepository;
  GetPopularUseCase(this.movieRepository);
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await movieRepository.getPopular();
  }
}
