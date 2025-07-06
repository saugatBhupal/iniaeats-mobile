import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';
import 'package:inaeats/src/features/orders/data/models/product_order_hive_model.dart';

class AppBoxesName {
  AppBoxesName._();
  static const String cartBox = 'cartBox';
  static const String orderBox = 'orderBox';
}

class AppBoxes {
  AppBoxes._();
  static Box<CartHiveModel> get userBox => Hive.box<CartHiveModel>(AppBoxesName.cartBox);
  static Box<ProductOrderHiveModel> get orderBox =>
      Hive.box<ProductOrderHiveModel>(AppBoxesName.orderBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
  static const String createdProjects = 'createdProjects';
}
