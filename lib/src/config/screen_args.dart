import 'package:inaeats/src/features/cart/domain/entities/cart.dart';

class OrderScreenArgs {
  final List<Cart> cartItems;
  final int totalPayable;

  OrderScreenArgs({required this.cartItems, required this.totalPayable});
}
