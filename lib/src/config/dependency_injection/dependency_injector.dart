import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inaeats/src/core/network/connectivity_checker.dart';
import 'package:inaeats/src/core/network/http_service.dart';
import 'package:inaeats/src/features/authentication/authentication_injector.dart';
import 'package:inaeats/src/features/home/home_injector.dart';
import 'package:inaeats/src/features/notifications/notification_injector.dart';
import 'package:inaeats/src/features/search/search_injector.dart';
import 'package:inaeats/src/features/splash/splash_injector.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  initSplash();
  initAuthentication();
  initHome();
  initSearch();
  initNotification();
}

void _initCore() {
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => CheckInternetConnectivity(connectivity: sl()),
  );
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerLazySingleton<Dio>(() => sl<HttpService>().dio);
  // sl.registerLazySingleton<HiveService>(() => HiveService());
  // sl.registerLazySingleton<SocketService>(() => SocketService());
}
