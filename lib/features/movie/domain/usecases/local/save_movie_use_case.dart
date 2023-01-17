import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class SaveMovieUseCase {
  final MovieRepository movieRepository;
  SaveMovieUseCase(this.movieRepository);

  Future<Either<Failure, void>> call(MovieTable movieTable) async {
    return await movieRepository.saveMovie(movieTable);
  }
}
