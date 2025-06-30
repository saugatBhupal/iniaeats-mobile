import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:uuid/uuid.dart';

class Allergen {
  final String id;
  final String name;
  final Set<Product> products;

  Allergen({required this.id, required this.name, required this.products});

  factory Allergen.initial() => Allergen(id: Uuid().v4(), name: '', products: <Product>{});

  Allergen copyWith({String? id, String? name, Set<Product>? products}) {
    return Allergen(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
    );
  }
}
