import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetMovieDetailUseCase {
  MovieRepository movieRepository;
  GetMovieDetailUseCase(this.movieRepository);
  Future<Either<Failure, MovieDetailEntity>> call(MovieParams movieParams) async {
    return await movieRepository.getMovieDetails(movieParams);
  }
}