import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/drawer/navigation_drawer_widget.dart';
import 'package:movies/core/widgets/internet/custom_no_internet.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_background/movie_background_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_carousel_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousel/movie_carousel_state.dart';
import 'package:movies/features/movie/presentation/bloc/movie_search/movie_search_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movies/features/movie/presentation/widgets/movie_carousal/movie_carousal_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_tab_movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselCubit movieCarouselCubit;
  late MovieBackgroundCubit movieBackgroundCubit;
  late MovieTabbedCubit movieTabbedCubit;
  late MovieSearchCubit movieSearchCubit;

  @override
  void initState() {
    super.initState();
    movieCarouselCubit = getIt<MovieCarouselCubit>();
    movieBackgroundCubit = movieCarouselCubit.movieBackgroundCubit;
    movieTabbedCubit = getIt<MovieTabbedCubit>();
    movieSearchCubit = getIt<MovieSearchCubit>();
    movieCarouselCubit.loadCarousel();
    movieTabbedCubit.movieTabChanged();
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselCubit.close();
    movieBackgroundCubit.close();
    movieTabbedCubit.close();
    movieSearchCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselCubit,
        ),
        BlocProvider(
          create: (context) => movieBackgroundCubit,
        ),
        BlocProvider(
          create: (context) => movieTabbedCubit,
        ),
        BlocProvider(
          create: (context) => movieSearchCubit,
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
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
                  ),
                  const CustomNoInternet(),
                ],
              );
            }
            //  else if (state is MovieCarouselError) {
            //   return MovieCarousalErrorWidget(
            //     failureType:state.errorType ,
            //     onPressedRetry: () => movieCarouselCubit.loadCarousel(),,
            //     errorType: ,
            //   );
            // }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
