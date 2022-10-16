import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/usecases/get_coming_soon_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_playing_now_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_popular_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';

class MovieTabbedCubit extends Cubit<MovieTabbedState> {
  GetPopularUseCase getPopularUseCase;
  GetPlayingNowUseCase getPlayingNowUseCase;
  GetComingSonUseCase getComingSonUseCase;

  MovieTabbedCubit(
    this.getComingSonUseCase,
    this.getPlayingNowUseCase,
    this.getPopularUseCase,
  ) : super(MovieTabbedState.init());

  void movieTabChanged({int currentTabIndex = 0}) async {
    emit(state.copyWith(defaultIndex: currentTabIndex));
    late Either<Failure, List<MovieEntity>> moviesEither;
    switch (currentTabIndex) {
      case 0:
        moviesEither = await getPopularUseCase();
        break;
      case 1:
        moviesEither = await getPlayingNowUseCase();
        break;
      case 2:
        moviesEither = await getComingSonUseCase();
        break;
    }
    emit(
      moviesEither.fold(
        (l) => state.copyWith(defaultIndex: currentTabIndex),
        (movies) => state.copyWith(
          defaultIndex: currentTabIndex,
          movies: movies,
        ),
      ),
    );
  }
}
