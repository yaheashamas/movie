import 'package:movies/core/error/handel_body_repository_impl.dart/handel_body_repository_impl.dart';
import 'package:movies/core/interNet/connection.dart';
import 'package:movies/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends HandelBodyRepositoryImpl
    implements MovieRepository {
  MovieRemoteDateSourceImpl movieRemoteDateSourceImpl;

  MovieRepositoryImpl(
    this.movieRemoteDateSourceImpl,
    ConnectionToEnterNet connectionToEnterNet,
  ) : super(connectionToEnterNet);

  @override
  Future<Either<Failure, List<MovieModel>>> getComingSoon() async {
    return body(() async {
      var result = await movieRemoteDateSourceImpl.getComingSoon();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPlayingNow() async {
    return body(() async {
      var result = await movieRemoteDateSourceImpl.getPlayingNow();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopular() async {
    return body(() async {
      var result = await movieRemoteDateSourceImpl.getPopular();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrending() async {
    return body(() async {
      var result = await movieRemoteDateSourceImpl.getTrending();
      return right(result);
    });
  }
}
