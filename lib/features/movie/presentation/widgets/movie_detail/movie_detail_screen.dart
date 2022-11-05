import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/domain/entities/movie_params.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_detail/movie_detail_state.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_big_post_widget.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailScreen({
    required this.movieId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<MovieDetailCubit>()
          ..loadMovieDetail(
            MovieParams(movieId),
          ),
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              var movieDetail = state.movieDetailEntity;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MovieDetailBigPostWidget(movieDetailEntity: movieDetail),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.h),
                    child: Text(
                      movieDetail.overview!,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
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
