import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception/exception.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/core/interNet/connection.dart';

typedef SafeCallBody<RV> = Future<Either<Failure, RV>> Function();

class HandelBodyRepositoryImpl {
  final ConnectionToEnterNet connectionToEnterNet;
  HandelBodyRepositoryImpl(this.connectionToEnterNet);

  Future<Either<Failure, RV>> body<RV>(SafeCallBody<RV> body) async {
    if (await connectionToEnterNet.ifExistEnterNet) {
      try {
        return await body();
      } on ServerException catch (e) {
        return left(ServerFailure(e.error));
      } catch (e) {
        return left(UnknownFailure());
      }
    } else {
      return left(NoInterNetFailure());
    }
  }
}
