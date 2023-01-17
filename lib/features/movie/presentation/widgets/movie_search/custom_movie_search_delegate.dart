import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/config/common/extensions/string_extensions.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/presentation/bloc/movie_search/movie_search_cubit.dart';
import 'package:movies/features/movie/presentation/bloc/movie_search/movie_search_state.dart';
import 'package:movies/features/movie/presentation/widgets/app_error/app_error_widget.dart';
import 'movie_search_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final MovieSearchCubit movieSearchCubit;

  CustomSearchDelegate(this.movieSearchCubit);

  @override
  ThemeData appBarTheme(BuildContext context) => Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          disabledBorder: OutlineInputBorder(),
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
        ),
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.white : Colors.red,
          size: Sizes.dimen_24.h,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_24.h,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    movieSearchCubit.searchTermChanged(query);

    return BlocBuilder<MovieSearchCubit, MovieSearchState>(
      bloc: movieSearchCubit,
      builder: (context, state) {
        if (state is MovieSearchError) {
          return AppErrorWidget(
            failureType: FailureType.api,
            onPressedRetry: () => movieSearchCubit.searchTermChanged(query),
          );
        } else if (state is MovieSearchLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64.w),
                child: Text(
                  TranslationConstants.noMoviesSearched.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => MovieSearchCard(
              movie: movies[index],
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
