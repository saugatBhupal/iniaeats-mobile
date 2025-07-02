import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/badge/price_badge.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/core/widgets/symbols/ratings_symbol.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/timer_textspan.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class ProductTabCard extends StatelessWidget {
  final Product product;
  const ProductTabCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.mealDetails, arguments: product),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width * 0.64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(AppImages.mealTab),
                  Positioned(top: -8, left: -5, child: PriceBadge(price: product.price)),
                ],
              ),
            ),

            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      product.productName,
                      style: context.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                    ),
                  ),

                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FoodMarkSymbol(dietType: product.dietType),
                      const SizedBox(width: 6),
                      const RatingsSymbol(),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TimerTextspan(duration: product.duration),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BulletTextspan(label: "${product.calories} Kcal"),
                  ),
                  BulletTextspan(label: product.tags.last.name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
