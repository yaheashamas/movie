import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';

import '../../../domain/entities/movie_entity.dart';
import 'favorite_movie_card_widget.dart';

class FavoriteMovieGridView extends StatelessWidget {
  final List<MovieEntity> movies;

  const FavoriteMovieGridView({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      padding: EdgeInsets.all(Sizes.dimen_8.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: Sizes.dimen_2.w,
        mainAxisSpacing: Sizes.dimen_8.w,
      ),
      itemBuilder: (context, index) {
        return FavoriteMovieCardWidget(
          movie: movies[index],
        );
      },
    );
  }
}
