import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/route_constants.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/presentation/bloc/movie_favorate/movie_favorate_cubit.dart';
import '../../../domain/entities/movie_entity.dart';
import '../movie_detail/movie_detail_arguments.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w),
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${Api.baseImageKey}${movie.posterPath}',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_20,
                    vertical: Sizes.dimen_10,
                  ),
                  child: GestureDetector(
                    onTap: () => context
                        .read<MovieFavorateCubit>()
                        .deleteMovie(movie.id),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_24.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              RouteList.movieDetail,
              arguments: MovieDetailArguments(movie.id),
            );
          },
        ),
      ),
    );
  }
}
