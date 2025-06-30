import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/entities/user.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/splash/domain/repositories/splash_repository.dart';

class GetCurrentUserUsecase implements UsecaseWithoutParams<User?> {
  final SplashRepository splashRepository;

  GetCurrentUserUsecase({required this.splashRepository});

  @override
  Future<Either<Failure, User?>> call() {
    return splashRepository.getCurrentUser();
  }
}
