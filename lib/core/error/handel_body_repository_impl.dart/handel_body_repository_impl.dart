import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/error/failure/failure.dart';

typedef SafeCallBody<RV> = Future<Either<Failure, RV>> Function();

class HandelBodyRepositoryImpl {
  Future<Either<Failure, RV>> body<RV>(SafeCallBody<RV> body) async {
    try {
      return await body();
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return left(const Failure(FailureType.network));
      } else {
        return left(const Failure(FailureType.api));
      }
    }
  }
}
