import 'package:get_it/get_it.dart';
import 'package:movies/core/interNet/connection.dart';
import 'package:movies/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';
import 'package:movies/features/movie/domain/usecases/get_coming_soon_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_playing_now_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_popular_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/internet/internet_bloc.dart';
import 'package:movies/features/movie/presentation/bloc/language/language_bloc.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';

final getIt = GetIt.instance;
Future<void> configureInjection() async {
  //configuration app
  getIt.registerLazySingleton<ConnectionToEnterNet>(
    () => ConnectionToEnterNetImpl(),
  );
  //first feature
  //data source
  getIt.registerLazySingleton<MovieRemoteDateSource>(
    () => MovieRemoteDateSourceImpl(),
  );
  //repository
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getIt(),
    ),
  );
  //use cases
  getIt.registerLazySingleton(() => GetComingSonUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPlayingNowUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTrendingUseCase(getIt()));
  //bloc
  getIt.registerFactory(() => MovieCarousalCubit(getIt()));
  getIt.registerFactory(() => MovieTabbedCubit(getIt(), getIt(), getIt()));
  getIt.registerSingleton<LanguageBloc>(LanguageBloc());
  getIt.registerSingleton<InternetBloc>(InternetBloc());
}
