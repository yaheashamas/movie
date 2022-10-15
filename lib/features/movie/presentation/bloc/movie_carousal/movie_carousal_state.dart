import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';

abstract class MovieCarousalState extends Equatable {
  const MovieCarousalState();

  @override
  List<Object> get props => [];
}

class MovieCarousalInitial extends MovieCarousalState {}

class MovieCarousalError extends MovieCarousalState {}

class MovieCarousalLoaded extends MovieCarousalState {
  final List<MovieModel> movies;
  final int defaultIndex;
  const MovieCarousalLoaded({
    this.defaultIndex = 0,
    required this.movies,
  }) : assert(defaultIndex >= 0, "defaultIndex connect be less than 0");
}
