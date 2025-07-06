import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';

class ProductOrder {
  final List<Cart> cart;
  final int totalPrice;
  final String address;
  final DeliveryTiming timing;

  ProductOrder({
    required this.cart,
    required this.totalPrice,
    required this.address,
    required this.timing,
  });
}
