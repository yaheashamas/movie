import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/domain/entities/tables/movie_table.dart';
import 'package:movies/features/movie/presentation/pages/movie_app_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

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
  final appDucumentDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDucumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  //run main app
  runApp(MovieAppScreen());
}
