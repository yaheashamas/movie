import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class CheckIFMovieExsistUseCase {
  final MovieRepository movieRepository;
  CheckIFMovieExsistUseCase(this.movieRepository);

  Future<Either<Failure, bool>> call(int movieId) async {
    return await movieRepository.checkIfMovieExsist(movieId);
  }
}
