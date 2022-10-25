import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_state.dart';

class MovieCarousalCubit extends Cubit<MovieCarousalState> {
  final GetTrendingUseCase getTrendingUseCase;
  static MovieCarousalCubit get(context) => BlocProvider.of(context);
  MovieCarousalCubit(
    this.getTrendingUseCase,
  ) : super(MovieCarousalState.init());

  void loadCarousel({int defaultIndex = 0}) async {
    emit(state.copyWith(loaded: true));
    final movieEither = await getTrendingUseCase();

    movieEither.fold(
      (l) => emit(state.copyWith(movies: left(l))),
      (movies) {
        emit(state.copyWith(
          defaultIndex: defaultIndex,
          movies: right(movies),
          loaded: false,
        ));
      },
    );
  }

  void changeValueIndexMovie(int index) {
    emit(state.copyWith(defaultIndex: index));
  }
}
