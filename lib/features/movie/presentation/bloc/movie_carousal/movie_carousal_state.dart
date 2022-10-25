import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

class MovieCarousalState extends Equatable {
  final Either<Failure, List<MovieEntity>> movies;
  final int defaultIndex;
  final bool loaded;

  const MovieCarousalState({
    required this.movies,
    required this.defaultIndex,
    required this.loaded,
  });

  factory MovieCarousalState.init() {
    return MovieCarousalState(
      movies: right([]),
      defaultIndex: 0,
      loaded: false,
    );
  }

  @override
  List<Object> get props => [movies, defaultIndex, loaded];

  MovieCarousalState copyWith({
    Either<Failure, List<MovieEntity>>? movies,
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
