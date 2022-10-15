import 'package:flutter/material.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/presentation/widgets/app_bar_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_carousal.dart/movie_background_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_carousal.dart/movie_page_view_widget.dart';

class MovieCarousalWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarousalWidget({
    Key? key,
    required this.defaultIndex,
    required this.movies,
  })  : assert(defaultIndex >= 0, "defaultIndex connect be less than 0"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackGroundWidget(),
        Column(
          children: [
            const AppBarWidget(),
            MoviePageViewWidget(
              initialPage: defaultIndex,
              movies: movies,
            ),
          ],
        ),
      ],
    );
  }
}
