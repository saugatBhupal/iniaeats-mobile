import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:uuid/uuid.dart';

class Tag {
  final String id;
  final String name;
  Set<Product> products;
  Tag({required this.id, required this.name, required this.products});

  factory Tag.initial() => Tag(id: Uuid().v4(), name: '', products: <Product>{});

  Tag copyWith({String? id, String? name, Set<Product>? products}) {
    return Tag(id: id ?? this.id, name: name ?? this.name, products: products ?? this.products);
  }
}
