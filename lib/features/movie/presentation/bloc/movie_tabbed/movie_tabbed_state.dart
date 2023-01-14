import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';

abstract class MovieTabbedState extends Equatable {
  final int defaultIndex;
  const MovieTabbedState({this.defaultIndex = 0});
  List<Object?> get props => [defaultIndex];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabbedChanged({
    required this.movies,
    int defaultIndex = 0,
  }) : super(defaultIndex: defaultIndex);

  @override
  List<Object> get props => [movies, defaultIndex];
}

class MovieTabbedError extends MovieTabbedState {
  final FailureType failureType;
  const MovieTabbedError({
    required this.failureType,
    int defaultIndex = 0,
  }) : super(defaultIndex: defaultIndex);
}

class MovieTabLoading extends MovieTabbedState {
  const MovieTabLoading({int currentTabIndex = 0})
      : super(defaultIndex: currentTabIndex);
}
