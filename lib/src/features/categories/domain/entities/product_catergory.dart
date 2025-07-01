import 'package:uuid/uuid.dart';
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

  factory ProductCategory.initial() =>
      ProductCategory(id: const Uuid().v4(), name: '', image: '', products: <Product>{});

  ProductCategory copyWith({String? id, String? name, String? image, Set<Product>? products}) {
    return ProductCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      products: products ?? this.products,
    );
  }

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] ?? const Uuid().v4(),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      products: <Product>{},
    );
  }
}
