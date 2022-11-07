import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

abstract class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchError extends MovieSearchState {}

class MovieSearchLoaded extends MovieSearchState {
  final List<MovieEntity> movies;

  const MovieSearchLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}
