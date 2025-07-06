import 'package:flutter/material.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/order_product_card.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class OrderItemsList extends StatelessWidget {
  final List<Product> products;
  const OrderItemsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(height: 14),
        itemBuilder: (context, index) {
          final item = products[index];
          return OrderProductCard(
            name: item.productName,
            ingredients: item.tags.map((tag) => tag.name).toList(),
            price: item.price,
          );
        },
      ),
    );
  }
}
