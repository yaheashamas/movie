import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/common/constants/size_constants.dart';
import 'package:movies/features/movie/domain/entities/movie_entity.dart';
import 'package:movies/features/movie/presentation/bloc/movie_carousal/movie_carousal_cubit.dart';
import 'package:movies/features/movie/presentation/widgets/movie_carousal/animated_movie_card_widget.dart';

class MoviePageViewWidget extends StatefulWidget {
  final int initialPage;
  final List<MovieEntity> movies;

  const MoviePageViewWidget({
    Key? key,
    required this.initialPage,
    required this.movies,
  }) : super(key: key);

  @override
  State<MoviePageViewWidget> createState() => _MoviePageViewWidgetState();
}

class _MoviePageViewWidgetState extends State<MoviePageViewWidget> {
  late PageController? pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil().screenHeight * 0.35,
      child: PageView.builder(
        controller: pageController,
        pageSnapping: true,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            movieId: movie.id,
            posterPath: movie.posterPath,
            pageController: pageController!,
          );
        },
        onPageChanged: (index) {
          context.read<MovieCarousalCubit>().changeValueIndexMovie(index);
        },
      ),
    );
  }
}
