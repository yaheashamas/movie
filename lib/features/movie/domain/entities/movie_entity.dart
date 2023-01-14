import 'package:equatable/equatable.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity movieDetailEntity) {
    return MovieEntity(
      posterPath: movieDetailEntity.posterPath,
      id: movieDetailEntity.id,
      backdropPath: movieDetailEntity.backdropPath ?? '-',
      title: movieDetailEntity.title,
      voteAverage: movieDetailEntity.voteAverage,
      releaseDate: movieDetailEntity.releaseDate,
    );
  }
}
