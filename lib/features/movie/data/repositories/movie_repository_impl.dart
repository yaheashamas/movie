import 'package:movies/core/error/handel_body_repository_impl.dart/handel_body_repository_impl.dart';
import 'package:movies/features/movie/data/datasources/local/movie_locale_data_souce.dart';
import 'package:movies/features/movie/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/features/movie/domain/entities/cast_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';
import 'package:movies/features/movie/domain/entities/video_entity.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends HandelBodyRepositoryImpl
    implements MovieRepository {
  MovieRemoteDateSource movieRemoteDateSource;
  MovieLocalDataSource movieLocalDataSource;

  MovieRepositoryImpl(
    this.movieRemoteDateSource,
    this.movieLocalDataSource,
  ) : super();

  @override
  Future<Either<Failure, List<MovieModel>>> getComingSoon() async {
    return body(() async {
      var result = await movieRemoteDateSource.getComingSoon();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPlayingNow() async {
    return body(() async {
      var result = await movieRemoteDateSource.getPlayingNow();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopular() async {
    return body(() async {
      var result = await movieRemoteDateSource.getPopular();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrending() async {
    return body(() async {
      var result = await movieRemoteDateSource.getTrending();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(
    MovieParams movieParams,
  ) {
    return body(() async {
      var result = await movieRemoteDateSource.getMovieDetail(movieParams);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<CastEntity>>> getCastCrew(int id) async {
    return body(() async {
      var result = await movieRemoteDateSource.getCastCrew(id);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id) async {
    return body(() async {
      var result = await movieRemoteDateSource.getVideos(id);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getSearchedMovies(
    String searchTerm,
  ) async {
    return body(() async {
      var result = await movieRemoteDateSource.getSearchedMovies(searchTerm);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, bool>> checkIfMovieExsist(int movieId) async {
    return body(() async {
      var result = await movieLocalDataSource.checkIfMovieExsist(movieId);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, void>> deleteMovie(int movieId) async {
    return body(() async {
      var result = await movieLocalDataSource.deleteMovie(movieId);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieTable>>> getAllMovie() async {
    return body(() async {
      var result = await movieLocalDataSource.getAllMovie();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, void>> saveMovie(MovieTable movieTable) async {
    return body(() async {
      var result = await movieLocalDataSource.saveMovie(movieTable);
      return right(result);
    });
  }
}
