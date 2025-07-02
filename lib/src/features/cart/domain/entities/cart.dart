import 'package:inaeats/src/features/products/domain/entities/product.dart';

class Cart {
  final Product product;
  final int quantity;

  Cart({required this.product, required this.quantity});
}
