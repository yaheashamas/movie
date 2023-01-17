import 'package:get_it/get_it.dart';
import 'package:movies/features/movie/data/datasources/local/app_local_data_source.dart';
import 'package:movies/features/movie/data/datasources/local/movie_locale_data_souce.dart';
import 'package:movies/features/movie/data/datasources/remote/movie_remote_data_source.dart';
import 'package:movies/features/movie/data/repositories/app_repository_impl.dart';
import 'package:movies/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movies/features/movie/domain/repositories/app_repository.dart';
import 'package:movies/features/movie/domain/repositories/movie_repository.dart';
import 'package:movies/features/movie/domain/usecases/local/check_if_movie_exsist_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/delete_movie_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/get_all_movie_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/get_preferred_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/save_movie_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/update_language_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_cast_crew_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_coming_soon_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/get_playing_now_use_case.dart';
import 'package:movies/features/movie/domain/usecases/remote/search_movies_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/language/language_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/loading/loading_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_carousel_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/cast/cast_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_favorate/movie_favorate_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_search/movie_search_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';

import 'features/movie/domain/usecases/remote/get_movie_details_use_case.dart';
import 'features/movie/domain/usecases/remote/get_popular_use_case.dart';
import 'features/movie/domain/usecases/remote/get_trending_use_case.dart';
import 'features/movie/domain/usecases/remote/get_videos_use_case.dart';

final getIt = GetIt.instance;
Future<void> configureInjection() async {
  //data source
  //remote
  getIt.registerLazySingleton<MovieRemoteDateSource>(
    () => MovieRemoteDateSourceImpl(),
  );
  //local
  getIt.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<AppLocalDataSource>(
    () => AppLocalDataSrouceImpl(),
  );

  //repository
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getIt()),
  );
  
  //use cases
  //reomte
  getIt.registerLazySingleton(() => GetComingSonUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPlayingNowUseCase(getIt()));
  getIt.registerLazySingleton(() => GetPopularUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTrendingUseCase(getIt()));
  getIt.registerLazySingleton(() => GetMovieDetailUseCase(getIt()));
  getIt.registerLazySingleton(() => GetCastUseCase(getIt()));
  getIt.registerLazySingleton(() => GetVideosUseCase(getIt()));
  getIt.registerLazySingleton(() => SearchMoviesUseCase(getIt()));
  //local
  getIt.registerLazySingleton(() => GetAllMovieUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckIFMovieExsistUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveMovieUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteMovieUseCase(getIt()));

  getIt.registerLazySingleton(() => GetPreferredUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateLanguageUseCase(getIt()));

  //bloc
  getIt.registerFactory(() => MovieBackgroundCubit());
  getIt.registerFactory(() => MovieCarouselCubit(
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory(() => MovieTabbedCubit(
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory<CastCubit>(() => CastCubit(getIt()));
  getIt.registerFactory<VideosCubit>(() => VideosCubit(getIt()));
  getIt.registerFactory<MovieFavorateCubit>(() => MovieFavorateCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory<MovieDetailCubit>(() => MovieDetailCubit(
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ));
  getIt.registerFactory<MovieSearchCubit>(() => MovieSearchCubit(
        getIt(),
        getIt(),
      ));
  getIt.registerSingleton<LoadingCubit>(LoadingCubit());
  getIt.registerSingleton<LanguageCubit>(LanguageCubit(getIt(), getIt()));
}
