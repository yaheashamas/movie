import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilderWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilderWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 14.w);
        },
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = movies[index];
          return MovieTabCardWidget(
            movieId: movieEntity.id,
            title: movieEntity.title,
            posterPath: movieEntity.posterPath,
          );
        },
      ),
    );
  }
}
