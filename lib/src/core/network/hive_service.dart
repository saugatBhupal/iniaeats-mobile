import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaeats/src/core/constants/app_boxes.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';
import 'package:inaeats/src/features/orders/data/models/product_order_hive_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}inaeats.db';

    Hive.init(path);
    Hive.registerAdapter(CartHiveModelAdapter());
    Hive.registerAdapter(ProductOrderHiveModelAdapter());
    await Hive.openBox<CartHiveModel>(AppBoxesName.cartBox);
    await Hive.openBox<ProductOrderHiveModel>(AppBoxesName.orderBox);
  }
}
