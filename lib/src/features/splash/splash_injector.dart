import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:inaeats/src/features/splash/data/datasources/remote/splash_remote_datasource_impl.dart';
import 'package:inaeats/src/features/splash/data/repositories/splash_remote_repository.dart';
import 'package:inaeats/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:inaeats/src/features/splash/domain/usecases/get_current_user_usecase.dart';
import 'package:inaeats/src/features/splash/presentation/bloc/splash_bloc.dart';

void initSplash() {
  sl.registerLazySingleton<SplashRemoteDatasource>(() => SplashRemoteDatasourceImpl());
  sl.registerLazySingleton<SplashRepository>(() => SplashRemoteRepository());
  sl.registerLazySingleton<GetCurrentUserUsecase>(
    () => GetCurrentUserUsecase(splashRepository: sl()),
  );
  sl.registerFactory<SplashBloc>(() => SplashBloc(getCurrentUser: sl()));
}
