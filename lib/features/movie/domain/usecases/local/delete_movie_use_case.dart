import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class DeleteMovieUseCase {
  final MovieRepository movieRepository;
  DeleteMovieUseCase(this.movieRepository);

  Future<Either<Failure, void>> call(int movieId) async {
    return await movieRepository.deleteMovie(movieId);
  }
}