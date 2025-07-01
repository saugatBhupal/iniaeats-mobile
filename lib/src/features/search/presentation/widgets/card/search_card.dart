import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/badge/price_badge.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/core/widgets/symbols/ratings_symbol.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/timer_textspan.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class SearchProductCard extends StatelessWidget {
  final Product product;
  const SearchProductCard({super.key, required this.product});
  static const _gap = SizedBox(width: 8.0);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.mealDetails),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(AppImages.recommended),
                  Positioned(top: -8, left: -6, child: PriceBadge(price: product.price)),
                ],
              ),
            ),

            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(product.productName, style: context.titleMedium),
                  SizedBox(width: 6),
                  FoodMarkSymbol(dietType: product.dietType),
                  const Spacer(),
                  const RatingsSymbol(),
                ],
              ),
            ),

            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  TimerTextspan(duration: product.duration),
                  _gap,
                  BulletTextspan(label: "${product.calories} Kcal"),
                  _gap,
                  BulletTextspan(label: product.productType),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  ...product.tags.take(4).toList().asMap().entries.map((entry) {
                    final index = entry.key;
                    final tag = entry.value;
                    final tagsToShow = product.tags.take(4).toList();

                    return Row(
                      children: [
                        Text(
                          tag.name[0].toUpperCase() + tag.name.substring(1),
                          style: context.bodySmall.copyWith(
                            color: AppColors.black.withValues(alpha: 0.45),
                          ),
                        ),
                        if (index != tagsToShow.length - 1) _gap,
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
