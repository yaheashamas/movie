import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';
import 'package:movies/features/movie/domain/usecases/local/check_if_movie_exsist_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/delete_movie_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/get_all_movie_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/save_movie_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/loading/loading_cubit.dart';

part 'movie_favorate_state.dart';

class MovieFavorateCubit extends Cubit<MovieFavorateState> {
  GetAllMovieUseCase getAllMovieUseCase;
  SaveMovieUseCase saveMovieUseCase;
  DeleteMovieUseCase deleteMovieUseCase;
  CheckIFMovieExsistUseCase checkIFMovieExsistUseCase;

  LoadingCubit loadingCubit;

  MovieFavorateCubit(
    this.checkIFMovieExsistUseCase,
    this.deleteMovieUseCase,
    this.getAllMovieUseCase,
    this.saveMovieUseCase,
    this.loadingCubit,
  ) : super(MovieFavorateInitial());

  getAllMovie() {
    loadingCubit.show();
    getAllMovieUseCase().then(
      (value) => value.fold(
        (l) => emit(MovieFavorateError()),
        (r) => emit(MovieFavorateLoaded(r)),
      ),
    );
    loadingCubit.hide();
  }

  toggleSaveMovie(MovieTable movieTable, bool isFavorate) async {
    if (isFavorate) {
      await deleteMovieUseCase(movieTable.id);
    } else {
      await saveMovieUseCase(movieTable);
    }

    final reesponce = await checkIFMovieExsistUseCase(movieTable.id);
    emit(reesponce.fold(
      (l) => MovieFavorateError(),
      (r) => IsFavorateMovie(r),
    ));
  }

  deleteMovie(int id) {
    deleteMovieUseCase(id).then(
      (value) => value.fold(
        (l) => emit(MovieFavorateError()),
        (r) => getAllMovie(),
      ),
    );
  }

  ifFavorateMove(int id) {
    checkIFMovieExsistUseCase(id).then(
      (value) => value.fold(
        (l) => emit(MovieFavorateError()),
        (r) => emit(IsFavorateMovie(r)),
      ),
    );
  }
}
