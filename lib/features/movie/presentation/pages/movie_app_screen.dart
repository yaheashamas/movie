import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/theme/theme_color.dart';
import 'package:movies/config/theme/theme_text.dart';
import 'package:movies/features/movie/presentation/pages/home_screen.dart';

class MovieAppScreen extends StatelessWidget {
  const MovieAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
