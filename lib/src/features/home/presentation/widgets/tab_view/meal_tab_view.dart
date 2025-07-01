import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/home/presentation/widgets/card/product_tab_card.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class MealTabView extends StatelessWidget {
  final List<Product> products;
  const MealTabView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.28,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 16 : 0.0),
              child: ProductTabCard(product: products[index]),
            ),
        separatorBuilder: (context, index) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
