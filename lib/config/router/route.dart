import 'package:flutter/cupertino.dart';
import 'package:movies/config/common/constants/route_constants.dart';
import 'package:movies/features/movie/presentation/pages/home_screen.dart';
import 'package:movies/features/movie/presentation/widgets/movie_detail/movie_detail_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => const HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieId: settings.name as int,
            ),
      };
}
