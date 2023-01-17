import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/repositories/app_repository.dart';

class UpdateLanguageUseCase {
  final AppRepository appRepository;
  UpdateLanguageUseCase(this.appRepository);
  Future<Either<Failure, void>> call(String language) async {
    return await appRepository.updateLanguage(language);
  }
}
