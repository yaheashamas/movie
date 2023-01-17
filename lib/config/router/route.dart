import 'package:flutter/cupertino.dart';
import 'package:movies/config/common/constants/route_constants.dart';
import 'package:movies/features/movie/presentation/pages/home_screen.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_screen.dart';
import 'package:movies/features/movie/presentation/widgets/movie_favorate/favorite_screen.dart';
import 'package:movies/features/movie/presentation/widgets/watch_video/watch_video_arguments.dart';
import 'package:movies/features/movie/presentation/widgets/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => const HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieDetailArguments: settings.arguments as MovieDetailArguments,
            ),
        RouteList.watchTrailer: (context) => WatchVideoScreen(
              watchVideoArguments: settings.arguments as WatchVideoArguments,
            ),
        RouteList.favorite: (context) => FavoriteScreen()
      };
}
