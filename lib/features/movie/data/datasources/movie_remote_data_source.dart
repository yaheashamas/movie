import 'package:dio/dio.dart';
import 'package:movies/core/exception/exception.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/data/datasources/const.dart';
import 'package:movies/features/movie/data/models/movie_model.dart';
import 'package:movies/features/movie/data/models/movies_result_model.dart';

abstract class MovieRemoteDateSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getPlayingNoe();
}

class MovieRemoteDateSourceImpl extends MovieRemoteDateSource {
  @override
  Future<List<MovieModel>> getTrending() async {
    try {
      var response = await Api.dio.get(trendingAPI);
      final movies = MoviesResultModel.fromJson(response.data).movies;
      return movies;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    try {
      var response = await Api.dio.get(popularAPI);
      final movies = MoviesResultModel.fromJson(response.data).movies;
      return movies;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    try {
      var response = await Api.dio.get(comingSoonAPI);
      final movies = MoviesResultModel.fromJson(response.data).movies;
      return movies;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MovieModel>> getPlayingNoe() async {
    try {
      var response = await Api.dio.get(playingNowAPI);
      final movies = MoviesResultModel.fromJson(response.data).movies;
      return movies;
    } on DioError catch (e) {
      throw ServerException(e.message);
    }
  }
}
