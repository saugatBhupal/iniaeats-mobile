import 'package:inaeats/src/features/products/domain/entities/product.dart';

class ProductCategory {
  final String id;
  final String name;
  final String image;
  final Set<Product> products;

  ProductCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });
}
