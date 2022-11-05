import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailLoaded(this.movieDetailEntity);
  @override
  List<Object> get props => [movieDetailEntity];
}