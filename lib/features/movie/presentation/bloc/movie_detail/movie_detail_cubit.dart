import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/loading/loading_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/cast/cast_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_state.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_cubit.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  GetMovieDetailUseCase getMovieDetailUseCase;
  LoadingCubit loadingCubit;
  CastCubit castCubit;
  VideosCubit videosCubit;

  MovieDetailCubit(
    this.getMovieDetailUseCase,
    this.loadingCubit,
    this.castCubit,
    this.videosCubit,
  ) : super(MovieDetailInitial());

  void loadMovieDetail(MovieParams movieParams) async {
    loadingCubit.show();
    final Either<Failure, MovieDetailEntity> eitherResponse =
        await getMovieDetailUseCase(movieParams);
    emit(eitherResponse.fold(
      (l) => MovieDetailError(),
      (r) => MovieDetailLoaded(r),
    ));
    castCubit.loadCast(movieParams.id);
    videosCubit.loadVideos(movieParams.id);
    loadingCubit.hide();
  }
}
