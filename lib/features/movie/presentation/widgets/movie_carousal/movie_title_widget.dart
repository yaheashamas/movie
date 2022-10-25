import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_cubit.dart';

import '../../bloc/movie_carousal/movie_carousal_state.dart';

class MovieTitleWidget extends StatelessWidget {
  const MovieTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCarousalCubit, MovieCarousalState>(
      builder: (context, state) {
        return Text(
          state.movies.foldRight([], (r, previous) => r)[state.defaultIndex].title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headline6,
        );
      },
    );
  }
}
