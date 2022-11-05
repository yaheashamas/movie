import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

abstract class MovieBackGroundState extends Equatable {}

class MovieBackGroundInitial extends MovieBackGroundState {
  @override
  List<Object?> get props => [];
}

class MovieBackGroundLoaded extends MovieBackGroundState {
  final MovieEntity movie;

  MovieBackGroundLoaded(this.movie);
  @override
  List<Object?> get props => [movie];
}
