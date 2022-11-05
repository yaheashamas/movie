import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/data/datasources/const.dart';
import 'package:movies/features/movie/data/models/movie_detail_model.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/features/movie/data/models/movies_result_model.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';

abstract class MovieRemoteDateSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getPlayingNow();
  Future<MovieDetailModel> getMovieDetail(MovieParams movieParams);
}

class MovieRemoteDateSourceImpl extends MovieRemoteDateSource {
  @override
  Future<List<MovieModel>> getTrending() async {
    var response = await Api.dio.get(trendingAPI);
    final movies = MoviesResultModel.fromJson(response.data).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    var response = await Api.dio.get(popularAPI);
    final movies = MoviesResultModel.fromJson(response.data).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    var response = await Api.dio.get(comingSoonAPI);
    final movies = MoviesResultModel.fromJson(response.data).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    var response = await Api.dio.get(playingNowAPI);
    final movies = MoviesResultModel.fromJson(response.data).movies;
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(MovieParams movieParams) async {
    var response = await Api.dio.get("$movieDetailsAPI${movieParams.id}${Api.apiKey}");
    final movie = MovieDetailModel.fromJson(response.data);
    return movie;
  }
}
