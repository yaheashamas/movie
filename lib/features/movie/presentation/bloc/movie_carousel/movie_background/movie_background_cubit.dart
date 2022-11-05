import 'package:bloc/bloc.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_state.dart';

class MovieBackgroundCubit extends Cubit<MovieBackGroundState> {
  MovieBackgroundCubit() : super(MovieBackGroundInitial());

  void backdropChanged(MovieEntity movie) {
    emit(MovieBackGroundLoaded(movie));
  }
}
