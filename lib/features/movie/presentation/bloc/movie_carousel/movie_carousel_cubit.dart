import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/loading/loading_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final GetTrendingUseCase getTrendingUseCase;
  final LoadingCubit loadingCubit;
  final MovieBackgroundCubit movieBackgroundCubit;

  static MovieCarouselCubit get(context) => BlocProvider.of(context);

  MovieCarouselCubit(
    this.getTrendingUseCase,
    this.loadingCubit,
    this.movieBackgroundCubit,
  ) : super(MovieCarouselInitial());

  void loadCarousel({int defaultIndex = 0}) async {
    loadingCubit.show();
    final moviesEither = await getTrendingUseCase();
    emit(moviesEither.fold(
      (l) => MovieCarouselError(failureType: l.failureType),
      (movies) {
        movieBackgroundCubit.backdropChanged(movies[defaultIndex]);
        return MovieCarouselLoaded(
          movies: movies,
          defaultIndex: defaultIndex,
        );
      },
    ));
    loadingCubit.hide();
  }
}
