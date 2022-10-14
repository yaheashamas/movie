import 'package:flutter/material.dart';
import 'package:movies/core/network/api.dart';
import 'package:movies/features/movie/data/datasources/movie_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //display plan url
  await Api.initializeInterceptors();
  MovieRemoteDateSourceImpl movieRemoteDateSource = MovieRemoteDateSourceImpl();
  movieRemoteDateSource.getTrending();
  //run main app
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("data")),
      ),
    );
  }
}
