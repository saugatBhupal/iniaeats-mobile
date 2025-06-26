import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app.dart';
import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
}
