import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaeats/src/core/constants/app_boxes.dart';
import 'package:inaeats/src/features/orders/data/datasources/local/order_local_repository.dart';
import 'package:inaeats/src/features/orders/data/models/product_order_hive_model.dart';

class OrderLocalRepositoryImpl implements OrderLocalRepository {
  @override
  void addOrder(ProductOrderHiveModel order) async {
    var box = await Hive.openBox<ProductOrderHiveModel>(AppBoxesName.orderBox);
    await box.add(order);
    // print('Cart item added: ${order.cart.length}, quantity: ${order.address}');
    // print('All cart items:');
    // box.values.forEach((item) {
    //   print('Product ID: ${item.totalPrice}, Quantity: ${item.cart}');
    // });
  }

  @override
  void removeOrders() async {
    final box = await Hive.openBox<ProductOrderHiveModel>(AppBoxesName.orderBox);
    await box.clear();
  }

  @override
  Future<List<ProductOrderHiveModel>> getAllOrders() async {
    var box = await Hive.openBox<ProductOrderHiveModel>(AppBoxesName.orderBox);
    List<ProductOrderHiveModel> orders = box.values.toList();
    print('Cart item added: ${orders.length}, quantity:');
    print('All cart items:');
    box.values.forEach((item) {
      print('Product ID: ${item.totalPrice}, Quantity: ${item.address}');
    });
    return orders;
  }
}
