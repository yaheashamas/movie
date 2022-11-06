import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/cast/cast_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_state.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/videos/videos_cubit.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/cast_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_big_post_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/videos_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;
  const MovieDetailScreen({
    required this.movieDetailArguments,
    super.key,
  });

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailCubit _movieDetailCubit;
  late CastCubit _castCubit;
  late VideosCubit _videosCubit;

  @override
  void initState() {
    super.initState();
    _movieDetailCubit = getIt<MovieDetailCubit>();
    _castCubit = _movieDetailCubit.castCubit;
    _videosCubit = _movieDetailCubit.videosCubit;
    _movieDetailCubit.loadMovieDetail(MovieParams(widget.movieDetailArguments.movieId));
    _castCubit.loadCast(widget.movieDetailArguments.movieId);
  }

  @override
  void dispose() {
    _movieDetailCubit.close();
    _castCubit.close();
    _videosCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailCubit),
          BlocProvider.value(value: _castCubit),
          BlocProvider.value(value: _videosCubit),
        ],
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              var movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MovieDetailBigPostWidget(movieDetailEntity: movieDetail),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.h,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        movieDetail.overview!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                        vertical: Sizes.dimen_8.h,
                      ),
                      child: Text(
                        TranslationConstants.cast.t(context),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    CastWidget(),
                    VideosWidget(videosCubit: _videosCubit),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
