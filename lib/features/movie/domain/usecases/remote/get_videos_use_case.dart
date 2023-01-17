import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/video_entity.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';

class GetVideosUseCase {
  final MovieRepository movieRepository;
  GetVideosUseCase(this.movieRepository);

  Future<Either<Failure, List<VideoEntity>>> call(int id) async {
    return await movieRepository.getVideos(id);
  }
}
