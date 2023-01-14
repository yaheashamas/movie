import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_tabbed/movie_tabbed_state.dart';
import 'package:movies/features/movie/presentation/widgets/app_error/app_error_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_list_view_builder_widget.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_tab_constants.dart';
import 'package:movies/features/movie/presentation/widgets/movie_tabbed/movie_tab_title_widget.dart';

class MovieTabMovieWidget extends StatelessWidget {
  const MovieTabMovieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = MovieTabbedCubit.get(context);
    return BlocBuilder<MovieTabbedCubit, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < MovieTabConstants.movieTabs.length; i++)
                    MovieTabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => context
                          .read<MovieTabbedCubit>()
                          .movieTabChanged(currentTabIndex: i),
                      isSelected: MovieTabConstants.movieTabs[i].index ==
                          state.defaultIndex,
                    ),
                ],
              ),
              SizedBox(height: Sizes.dimen_10.h),
              if (state is MovieTabbedChanged)
                Expanded(
                  child: state.movies.isEmpty
                      ? Center(
                          child: Text(
                            TranslationConstants.noMovies.t(context),
                          ),
                        )
                      : MovieListViewBuilderWidget(movies: state.movies),
                ),
              if (state is MovieTabbedError)
                Expanded(
                  child: AppErrorWidget(
                    failureType: state.failureType,
                    onPressedRetry: () => bloc.movieTabChanged(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
