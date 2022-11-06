import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/video_entity.dart';
import 'package:movies/features/movie/domain/usecases/get_videos_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideosUseCase getVideosUseCase;

  VideosCubit(
    this.getVideosUseCase,
  ) : super(VideosInitial());

  void loadVideos(int movieId) async {
    final Either<Failure, List<VideoEntity>> eitherVideoResponse =
        await getVideosUseCase(movieId);

    emit(eitherVideoResponse.fold(
      (l) => NoVideos(),
      (r) => VideosLoaded(r),
    ));
  }
}
