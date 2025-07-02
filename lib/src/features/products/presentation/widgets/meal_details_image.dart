import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/core/widgets/buttons/icon_button.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/products/presentation/widgets/textspan/meal_detail_icon_row.dart';

class MealDetailsImage extends StatelessWidget {
  final Product product;
  final double scrollOffset;
  const MealDetailsImage({super.key, required this.scrollOffset, required this.product});

  @override
  Widget build(BuildContext context) {
    final maxHeight = context.height / 1.8;
    final height = (maxHeight - scrollOffset).clamp(275.0, maxHeight);

    final bottomContentBottom = (24 - scrollOffset).clamp(0.0, 4.0);

    return SizedBox(
      height: height,
      width: context.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.mealDetails, fit: BoxFit.cover),
          Positioned(
            top: context.statusBarSize > 60 ? 58 : context.statusBarSize,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppbarBackButton(),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.recipe),
                  child: Text(AppStrings.swipeDown, style: TextStyle(color: Colors.white70)),
                ),
                CustomIconButton(
                  icon: AppIcons.cart,
                  count: 10,
                  onTap: () => Navigator.of(context).pushNamed(AppRoutes.cart),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: bottomContentBottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        product.productName,
                        style: context.headlineSmall.copyWith(
                          fontWeight: FontThickness.semiBold,
                          color: AppColors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 12),
                    FoodMarkSymbol(dietType: product.dietType, padding: 6, circleSize: 8),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  product.productDescription,
                  textAlign: TextAlign.justify,
                  style: context.bodySmall.copyWith(
                    color: AppColors.border,
                    fontSize: 11,
                    fontWeight: FontThickness.light,
                    height: 1.2,
                  ),
                ),
                MealDetailIconRow(
                  duration: product.duration,
                  portion: product.portion,
                  calories: product.calories,
                  difficulty: product.difficulty.name,
                  productType: product.productType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
