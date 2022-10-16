// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movies/features/movie/data/models/movie_model.dart';

class MovieCarousalState extends Equatable {
  final List<MovieModel> movies;
  final int defaultIndex;
  final bool loaded;

  const MovieCarousalState({
    required this.movies,
    required this.defaultIndex,
    required this.loaded,
  });

  factory MovieCarousalState.init() {
    return const MovieCarousalState(
      movies: [],
      defaultIndex: 0,
      loaded: false,
    );
  }

  @override
  List<Object> get props => [movies, defaultIndex];

  MovieCarousalState copyWith({
    List<MovieModel>? movies,
    int? defaultIndex,
    bool? loaded,
  }) {
    return MovieCarousalState(
      movies: movies ?? this.movies,
      defaultIndex: defaultIndex ?? this.defaultIndex,
      loaded: loaded ?? this.loaded,
    );
  }
}
