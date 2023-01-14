import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? video;
  final int? voteCount;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final bool? adult;
  final double? popularity;
  final String? mediaType;

  const MovieModel({
    required int id,
    required String title,
    required String posterPath,
    required String backdropPath,
    String? overview,
    double? voteAverage,
    String? releaseDate,
    this.video,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.adult,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'] ?? '',
      id: json['id'] ?? -1,
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'] ?? '',
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['video'] = video;
    data['vote_count'] = voteCount;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['backdrop_path'] = backdropPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}
