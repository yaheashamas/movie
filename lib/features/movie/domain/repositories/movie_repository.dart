import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/cast_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrending();
  Future<Either<Failure, List<MovieEntity>>> getPopular();
  Future<Either<Failure, List<MovieEntity>>> getComingSoon();
  Future<Either<Failure, List<MovieEntity>>> getPlayingNow();
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(
    MovieParams movieParams,
  );
  Future<Either<Failure, List<CastEntity>>> getCastCrew(int id);
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id);
  Future<Either<Failure, List<MovieEntity>>> getSearchedMovies(
    String searchTerm,
  );
}
