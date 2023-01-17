part of 'movie_favorate_cubit.dart';

abstract class MovieFavorateState extends Equatable {
  const MovieFavorateState();

  @override
  List<Object> get props => [];
}

class MovieFavorateInitial extends MovieFavorateState {}

class MovieFavorateLoaded extends MovieFavorateState {
  final List<MovieTable> movies;
  const MovieFavorateLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

class MovieFavorateError extends MovieFavorateState {}

class IsFavorateMovie extends MovieFavorateState {
  final bool isFavooratemovie;
  const IsFavorateMovie(this.isFavooratemovie);
  @override
  List<Object> get props => [isFavooratemovie];
}
