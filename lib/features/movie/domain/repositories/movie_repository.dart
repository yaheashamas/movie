import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTrending();
  Future<Either<Failure, List<MovieModel>>> getPopular();
  Future<Either<Failure, List<MovieModel>>> getComingSoon();
  Future<Either<Failure, List<MovieModel>>> getPlayingNow();
}
