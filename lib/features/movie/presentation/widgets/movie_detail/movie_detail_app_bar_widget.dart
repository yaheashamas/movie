import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie/domain/entities/movie_detail_entity.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';

import 'package:movies/features/movie/presentation/bloc/movie_favorate/movie_favorate_cubit.dart';

class MovieDetailAppBarWidget extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBarWidget({
    Key? key,
    required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
          BlocBuilder<MovieFavorateCubit, MovieFavorateState>(
            builder: (context, state) {
              if (state is IsFavorateMovie) {
                return TextButton(
                  onPressed: () {
                    context.read<MovieFavorateCubit>().toggleSaveMovie(
                          MovieTable.fromMovieEntity(movieDetailEntity),
                          state.isFavooratemovie,
                        );
                  },
                  child: Icon(
                    state.isFavooratemovie
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                );
              } else {
                return TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
