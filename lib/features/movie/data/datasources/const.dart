import 'package:movies/core/network/api.dart';

const String trendingAPI = "trending/movie/day${Api.apiKey}";
const String popularAPI = "movie/popular${Api.apiKey}";
const String comingSoonAPI = "movie/upcoming${Api.apiKey}";
const String playingNowAPI = "movie/now_playing${Api.apiKey}";
const String movieAPI = "movie/";
const String movieCastListAPI = "/credits${Api.apiKey}";
const String movieVideosAPI = "/videos${Api.apiKey}";