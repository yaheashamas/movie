import 'package:dio/dio.dart';

class Api {
  static const String apiKey = "?api_key=f33521953035af3fc3162fe1ac22e60c";
  static const String baseImageKey = "https://image.tmdb.org/t/p/w500";

  static var options = BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    receiveDataWhenStatusError: true,
  );
  static final Dio dio = Dio(options);

  static initializeInterceptors() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          var headers = {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          };
          request.headers.addAll(headers);
          return handler.next(request);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}
