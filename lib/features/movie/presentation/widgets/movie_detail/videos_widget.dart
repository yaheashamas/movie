import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/route_constants.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/core/widgets/global/button_widget.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_state.dart';
import 'package:movies/features/movie/presentation/widgets/watch_video/watch_video_arguments.dart';

class VideosWidget extends StatelessWidget {
  final VideosCubit videosCubit;

  const VideosWidget({
    Key? key,
    required this.videosCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosCubit, VideosState>(
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
            ),
            child: ButtonWidget(
              text: TranslationConstants.watchTrailers,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RouteList.watchTrailer,
                  arguments: WatchVideoArguments(_videos),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
