import 'package:dio/dio.dart';
import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:inaeats/src/features/authentication/data/datasources/remote/authentication_remote_datasource_impl.dart';
import 'package:inaeats/src/features/authentication/data/repositories/authentication_remote_repository.dart';
import 'package:inaeats/src/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/get_otp_usecase.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/register_user_usecase.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';

void initAuthentication() {
  sl.registerLazySingleton<AuthenticationRemoteDatasource>(
    () => AuthenticationRemoteDatasourceImpl(dio: sl<Dio>()),
  );
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRemoteRepository(authenticationRemoteDatasource: sl()),
  );
  sl.registerLazySingleton<GetOtpUsecase>(() => GetOtpUsecase(authenticationRepository: sl()));
  sl.registerLazySingleton<VerifyOtpUsecase>(
    () => VerifyOtpUsecase(authenticationRepository: sl()),
  );
  sl.registerLazySingleton<RegisterUserUsecase>(
    () => RegisterUserUsecase(authenticationRepository: sl()),
  );
  sl.registerFactory<AuthenticationBloc>(
    () =>
        AuthenticationBloc(getOtpUsecase: sl(), verifyOtpUsecase: sl(), registerUserUsecase: sl()),
  );
}
