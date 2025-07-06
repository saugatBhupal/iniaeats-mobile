import 'package:hive/hive.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';

part 'product_order_hive_model.g.dart';

@HiveType(typeId: 2)
class ProductOrderHiveModel extends HiveObject {
  @HiveField(0)
  final List<CartHiveModel> cart;

  @HiveField(1)
  final int totalPrice;

  @HiveField(2)
  final String address;

  @HiveField(3)
  final String timing;

  ProductOrderHiveModel({
    required this.cart,
    required this.totalPrice,
    required this.address,
    required this.timing,
  });
}
