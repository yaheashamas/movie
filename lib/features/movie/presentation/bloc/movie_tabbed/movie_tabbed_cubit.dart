import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_coming_soon_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_playing_now_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_popular_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';

class MovieTabbedCubit extends Cubit<MovieTabbedState> {
  GetPopularUseCase getPopularUseCase;
  GetPlayingNowUseCase getPlayingNowUseCase;
  GetComingSonUseCase getComingSonUseCase;
  static MovieTabbedCubit get(context) => BlocProvider.of(context);
  MovieTabbedCubit(
    this.getComingSonUseCase,
    this.getPlayingNowUseCase,
    this.getPopularUseCase,
  ) : super(MovieTabbedInitial());

  void movieTabChanged({int currentTabIndex = 0}) async {
    emit(MovieTabLoading(currentTabIndex: currentTabIndex));
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
    moviesEither.fold(
      (l) => emit(MovieTabbedError(failureType: l.failureType)),
      (movies) => emit(MovieTabbedChanged(
        movies: movies,
        defaultIndex: currentTabIndex,
      )),
    );
  }
}
