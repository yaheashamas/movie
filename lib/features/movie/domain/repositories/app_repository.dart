import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';

abstract class AppRepository {
  Future<Either<Failure, void>> updateLanguage(String language);
  Future<Either<Failure, String>> getPreferLangugae();
}
