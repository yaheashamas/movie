import 'package:hive/hive.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
  }) : super(
          id: id,
          title: title,
          posterPath: posterPath,
          backdropPath: '',
          releaseDate: '',
          voteAverage: 0,
        );

  factory MovieTable.fromMovieEntity(MovieDetailEntity movieDetailEntity) {
    return MovieTable(
      id: movieDetailEntity.id,
      title: movieDetailEntity.title,
      posterPath: movieDetailEntity.posterPath,
    );
  }
}
