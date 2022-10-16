import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

class MovieCarousalState extends Equatable {
  final List<MovieEntity> movies;
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
    List<MovieEntity>? movies,
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
