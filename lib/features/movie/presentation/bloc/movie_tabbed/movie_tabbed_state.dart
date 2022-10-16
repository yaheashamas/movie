
import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

class MovieTabbedState extends Equatable {
  final List<MovieEntity> movies;
  final int defaultIndex;
  final bool loaded;

  const MovieTabbedState({
    required this.movies,
    required this.defaultIndex,
    required this.loaded,
  });

  factory MovieTabbedState.init() {
    return const MovieTabbedState(
      movies: [],
      defaultIndex: 0,
      loaded: false,
    );
  }

  @override
  List<Object> get props => [movies, defaultIndex];

  MovieTabbedState copyWith({
    List<MovieEntity>? movies,
    int? defaultIndex,
    bool? loaded,
  }) {
    return MovieTabbedState(
      movies: movies ?? this.movies,
      defaultIndex: defaultIndex ?? this.defaultIndex,
      loaded: loaded ?? this.loaded,
    );
  }
}
