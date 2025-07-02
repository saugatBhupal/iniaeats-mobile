import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app.dart';
import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/core/network/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await initDependencies();
  runApp(const App());
}
