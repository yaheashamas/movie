import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_state.dart';

class MovieBackGroundWidget extends StatelessWidget {
  const MovieBackGroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            Sizes.dimen_40.w,
          ),
        ),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackgroundCubit, MovieBackGroundState>(
                builder: (context, state) {
                  if (state is MovieBackGroundLoaded) {
                    return CachedNetworkImage(
                      imageUrl:
                          '${Api.baseImageKey}${state.movie.backdropPath}',
                      fit: BoxFit.fitHeight,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
