import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';

class AppBoxesName {
  AppBoxesName._();
  static const String cartBox = 'cartBox';
}

class AppBoxes {
  AppBoxes._();
  static Box<CartHiveModel> get userBox => Hive.box<CartHiveModel>(AppBoxesName.cartBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
  static const String createdProjects = 'createdProjects';
}
