import 'package:bloc/bloc.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_state.dart';

class MovieCarousalCubit extends Cubit<MovieCarousalState> {
  final GetTrendingUseCase getTrendingUseCase;
  final MovieBackdropCubit movieBackdropCubit;

  MovieCarousalCubit(this.getTrendingUseCase, this.movieBackdropCubit)
      : super(MovieCarousalInitial());

  void loadCarousel({int defaultIndex = 0}) async {
    final movieEither = await getTrendingUseCase();
    movieEither.fold(
      (l) => emit(MovieCarousalError()),
      (movies) {
        movieBackdropCubit.backdropChanged(movies[defaultIndex]);
        emit(
          MovieCarousalLoaded(
            movies: movies,
            defaultIndex: defaultIndex,
          ),
        );
      },
    );
  }
}
