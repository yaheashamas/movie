import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_search_params.dart';
import 'package:movies/features/movie/presentation/bloc/loading/loading_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_search/movie_search_state.dart';

import '../../../domain/usecases/remote/search_movies_use_case.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  final SearchMoviesUseCase searchMovies;
  final LoadingCubit loadingCubit;

  MovieSearchCubit(
    this.loadingCubit,
    this.searchMovies,
  ) : super(MovieSearchInitial());

  Future<void> searchTermChanged(String searchTerm) async {
    loadingCubit.show();
    if (searchTerm.length > 2) {
      emit(MovieSearchLoading());
      final Either<Failure, List<MovieEntity>> response = await searchMovies(
        MovieSearchParams(
          searchTerm: searchTerm,
        ),
      );
      emit(response.fold(
        (l) => MovieSearchError(),
        (r) => MovieSearchLoaded(r),
      ));
    }
    loadingCubit.hide();
  }
}
