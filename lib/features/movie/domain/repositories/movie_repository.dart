import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/features/movie/domain/entities/cast_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTrending();
  Future<Either<Failure, List<MovieModel>>> getPopular();
  Future<Either<Failure, List<MovieModel>>> getComingSoon();
  Future<Either<Failure, List<MovieModel>>> getPlayingNow();
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(MovieParams movieParams);
  Future<Either<Failure, List<CastEntity>>> getCastCrew(int id);
  Future<Either<Failure, List<VideoEntity>>> getVideos(int id);
}
