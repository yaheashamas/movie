import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/presentation/pages/movie_app_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //display plan url
  await Api.initializeInterceptors();
  //di
  await configureInjection();
  unawaited(
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ),
  );
  //run main app
  runApp(const MovieAppScreen());
}
