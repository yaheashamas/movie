import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/features/movie/data/datasources/movie_remote_data_source.dart';
import 'package:movies/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';
import 'package:movies/features/movie/domain/usecases/get_coming_soon_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_playing_now_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_popular_use_case.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';

final getIt = GetIt.instance;
Future<void> configureDependencies() async {
  //configuration app
  getIt.registerSingleton(Connectivity());
  //first feature
  //data source
  getIt.registerLazySingleton<MovieRemoteDateSource>(
    () => MovieRemoteDateSourceImpl(),
  );
  //repository
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      getIt(),
      getIt(),
    ),
  );
  //data source
  getIt.registerLazySingleton(() => GetComingSonUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPlayingNowUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTrendingUseCase(getIt()));
  //bloc
}
