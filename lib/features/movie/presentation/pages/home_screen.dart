import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_state.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movies/features/movie/presentation/widgets/movie_carousal/movie_carousal_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_tab_movie_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<MovieCarousalCubit>()..loadCarousel(),
        ),
        BlocProvider(
          create: (context) => getIt.get<MovieTabbedCubit>()..movieTabChanged(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarousalCubit, MovieCarousalState>(
          builder: (context, state) {
            return state.loaded
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: MovieCarousalWidget(
                          defaultIndex: state.defaultIndex,
                          movies: state.movies,
                        ),
                      ),
                      const FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.4,
                        child: MovieTabMovieWidget(),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
