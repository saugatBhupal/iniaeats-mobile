import 'package:hive_flutter/hive_flutter.dart';
import 'package:inaeats/src/core/constants/app_boxes.dart';
import 'package:inaeats/src/features/cart/data/datasources/local/cart_local_datasource.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';

class CartLocalDatasourceImpl implements CartLocalDatasource {
  @override
  void addCartItem(CartHiveModel cartItem) async {
    var box = await Hive.openBox<CartHiveModel>(AppBoxesName.cartBox);
    await box.add(cartItem);
    // print('Cart item added: ${cartItem.productId}, quantity: ${cartItem.quantity}');
    // print('All cart items:');
    // box.values.forEach((item) {
    //   print('Product ID: ${item.productId}, Quantity: ${item.quantity}');
    // });
  }

  @override
  Future<List<CartHiveModel>> getCartItems() async {
    var box = await Hive.openBox<CartHiveModel>(AppBoxesName.cartBox);
    List<CartHiveModel> cartItems = box.values.toList();
    return cartItems;
  }

  @override
  void removeCartItem(CartHiveModel cartItem) async {
    var box = await Hive.openBox<CartHiveModel>(AppBoxesName.cartBox);
    final key = box.keys.firstWhere((k) {
      final item = box.get(k);
      return item?.productId == cartItem.productId;
    }, orElse: () => null);

    if (key != null) {
      await box.delete(key);
      print('Cart item removed: ${cartItem.productId}, quantity: ${cartItem.quantity}');
    } else {
      print('Item not found for deletion');
    }

    print('All cart items:');
    box.values.forEach((item) {
      print('Product ID: ${item.productId}, Quantity: ${item.quantity}');
    });
  }

  @override
  void removeCartItems() async {
    final box = await Hive.openBox<CartHiveModel>(AppBoxesName.cartBox);
    await box.clear();
  }
}
