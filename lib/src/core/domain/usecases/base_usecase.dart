import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/error/failure.dart';

abstract interface class UsecaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract interface class UsecaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}
