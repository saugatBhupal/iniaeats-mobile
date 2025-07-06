import 'package:inaeats/src/features/orders/data/models/product_order_hive_model.dart';

abstract class OrderLocalRepository {
  void addOrder(ProductOrderHiveModel order);
  Future<List<ProductOrderHiveModel>> getAllOrders();
  void removeOrders();
}
