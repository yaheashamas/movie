import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/cast_entity.dart';
import 'package:movies/features/movie/domain/usecases/get_cast_crew_use_case.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final GetCastUseCase getCast;

  CastCubit(this.getCast) : super(CastInitial());

  void loadCast(int movieId) async {
    Either<Failure, List<CastEntity>> eitherResponse = await getCast(movieId);
    emit(eitherResponse.fold(
      (l) => CastError(),
      (r) => CastLoaded(casts: r),
    ));
  }
}
