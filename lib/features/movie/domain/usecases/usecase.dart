import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}
