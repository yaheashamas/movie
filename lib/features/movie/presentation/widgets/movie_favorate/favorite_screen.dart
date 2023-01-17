import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/bloc/movie_favorate/movie_favorate_cubit.dart';

import 'favorite_movie_grid_view.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late MovieFavorateCubit _movieFavorateCubit;

  @override
  void initState() {
    super.initState();
    _movieFavorateCubit = getIt.get<MovieFavorateCubit>();
    _movieFavorateCubit.getAllMovie();
  }

  @override
  void dispose() {
    _movieFavorateCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(TranslationConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider.value(
        value: _movieFavorateCubit,
        child: BlocBuilder<MovieFavorateCubit, MovieFavorateState>(
          builder: (context, state) {
            if (state is MovieFavorateLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConstants.noFavoriteMovie.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              }
              return FavoriteMovieGridView(
                movies: state.movies,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}