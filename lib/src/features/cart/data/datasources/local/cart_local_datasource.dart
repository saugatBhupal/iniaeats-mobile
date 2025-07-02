import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';

abstract class CartLocalDatasource {
  void addCartItem(CartHiveModel cartItem);
  Future<List<CartHiveModel>> getCartItems();
  void removeCartItem(CartHiveModel cartItem);
}
