import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/config/theme/theme_color.dart';
import 'package:movies/config/theme/theme_text.dart';
import 'package:movies/config/common/constants/languages.dart';
import 'package:movies/core/language/app_localization.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/bloc/language/language_bloc.dart';
import 'package:movies/features/movie/presentation/pages/home_screen.dart';
import 'package:movies/features/movie/presentation/widgets/feedback/wiredash_widget.dart';

class MovieAppScreen extends StatelessWidget {
  final navKey = GlobalKey<NavigatorState>();
  MovieAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LanguageBloc>(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return ScreenUtilInit(
              designSize: const Size(414, 896),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return WireDashApp(
                  navigatorKey: navKey,
                  locale: state.locale,
                  child: MaterialApp(
                    navigatorKey: navKey,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      colorScheme: const ColorScheme.light(
                        primary: AppColor.royalBlue,
                      ),
                      dividerColor: Colors.transparent,
                      unselectedWidgetColor: AppColor.royalBlue,
                      primaryColor: AppColor.vulcan,
                      scaffoldBackgroundColor: AppColor.vulcan,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      textTheme: ThemeText.getTextTheme(),
                      appBarTheme: const AppBarTheme(elevation: 0),
                    ),
                    supportedLocales:
                        Languages.languages.map((e) => Locale(e.code)).toList(),
                    locale: state.locale,
                    localizationsDelegates: [
                      AppLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    home: const HomeScreen(),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
