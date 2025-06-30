import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/entities/user.dart';
import 'package:inaeats/src/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, User?>> getCurrentUser();
}
