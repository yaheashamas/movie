import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/domain/usecases/get_movie_details_use_case.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  GetMovieDetailUseCase getMovieDetailUseCase;

  MovieDetailCubit(
    this.getMovieDetailUseCase,
  ) : super(MovieDetailInitial());

  Future loadMovieDetail(MovieParams movieParams) async {
    final Either<Failure, MovieDetailEntity> eitherResponse = await getMovieDetailUseCase(movieParams);
    emit(eitherResponse.fold(
      (l) => MovieDetailError(),
      (r) => MovieDetailLoaded(r),
    ));
  }
}
