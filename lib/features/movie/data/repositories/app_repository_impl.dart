import 'package:dartz/dartz.dart';

import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/core/error/handel_body_repository_impl.dart/handel_body_repository_impl.dart';
import 'package:movies/features/movie/data/datasources/local/app_local_data_source.dart';
import 'package:movies/features/movie/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends HandelBodyRepositoryImpl
    implements AppRepository {
  AppLocalDataSource appLocalDataSource;

  AppRepositoryImpl(this.appLocalDataSource);

  @override
  Future<Either<Failure, String>> getPreferLangugae() async {
    return body(() async {
      var result = await appLocalDataSource.getPreferLangugae();
      return right(result);
    });
  }

  @override
  Future<Either<Failure, void>> updateLanguage(String language) async {
    return body(() async {
      var result = await appLocalDataSource.updateLanguage(language);
      return right(result);
    });
  }
}
