import 'package:flutter/material.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/di.dart';
import 'package:movies/features/movie/domain/usecases/get_trending_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //display plan url
  await Api.initializeInterceptors();
  //di
  await configureDependencies();
  getIt.get<GetTrendingUseCase>();
  //run main app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: Text("data")),
      ),
    );
  }
}
