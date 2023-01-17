import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure/failure.dart';
import 'package:movies/features/movie/domain/repositories/app_repository.dart';

class GetPreferredUseCase {
  final AppRepository appRepository;
  GetPreferredUseCase(this.appRepository);
  Future<Either<Failure, String>> call() async {
    return await appRepository.getPreferLangugae();
  }
}
