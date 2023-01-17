import 'package:hive/hive.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<List<MovieTable>> getAllMovie();
  Future<void> deleteMovie(int movieId);
  Future<void> saveMovie(MovieTable movieTable);
  Future<bool> checkIfMovieExsist(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  final nameDB = "movieBox";

  @override
  Future<bool> checkIfMovieExsist(int movieId) async {
    final movieBox = await Hive.openBox(nameDB);
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox(nameDB);
    await movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getAllMovie() async {
    final movieBox = await Hive.openBox(nameDB);
    final movieIds = movieBox.keys;
    List<MovieTable> movies = [];
    for (var id in movieIds) {
      movies.add(movieBox.get(id));
    }
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox(nameDB);
    await movieBox.put(movieTable.id, movieTable);
  }
}
