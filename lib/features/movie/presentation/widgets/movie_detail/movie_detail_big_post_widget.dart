import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/extensions/num_extensions.dart';
import 'package:movies/config/theme/theme_text.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_app_bar_widget.dart';

class MovieDetailBigPostWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailBigPostWidget({
    required this.movieDetailEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.0),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: "${Api.baseImageKey}${movieDetailEntity.posterPath}",
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movieDetailEntity.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movieDetailEntity.releaseDate!,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movieDetailEntity.voteAverage.convertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
          right: Sizes.dimen_16.w,
          left: Sizes.dimen_16.w,
          child: const MovieDetailAppBarWidget(),
        )
      ],
    );
  }
}
