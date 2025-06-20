import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inaeats/src/core/network/connectivity_checker.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
}

void _initCore() {
  sl.registerSingleton<Dio>(Dio());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => CheckInternetConnectivity(connectivity: sl()),
  );

  // sl.registerLazySingleton<HiveService>(() => HiveService());
  // sl.registerLazySingleton<HttpService>(() => HttpService(Dio()));
  // sl.registerLazySingleton<SocketService>(() => SocketService());
}
