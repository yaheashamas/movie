import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetAllMovieUseCase {
  final MovieRepository movieRepository;
  GetAllMovieUseCase(this.movieRepository);

  Future<Either<Failure, List<MovieTable>>> call() async {
    return await movieRepository.getAllMovie();
  }
}
