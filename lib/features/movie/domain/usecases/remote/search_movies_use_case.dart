import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_search_params.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;
  SearchMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    MovieSearchParams searchParams,
  ) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}
