import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetComingSonUseCase {
  MovieRepository movieRepository;
  GetComingSonUseCase(this.movieRepository);
  Future<Either<Failure, List<MovieModel>>> call() async {
    return await movieRepository.getComingSoon();
  }
}
