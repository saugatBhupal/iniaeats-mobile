import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/entities/user.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:inaeats/src/features/splash/domain/repositories/splash_repository.dart';

class SplashRemoteRepository implements SplashRepository {
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    User? userPref = await UserSharedPref.getUser();
    if (userPref != null) {
      return Right(userPref);
    } else {
      return const Right(null);
    }
  }
}
