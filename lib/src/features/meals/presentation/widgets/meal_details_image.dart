import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/core/widgets/buttons/icon_button.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/textspan/meal_details_icon_textspan.dart';

class MealDetailsImage extends StatelessWidget {
  final double scrollOffset;
  const MealDetailsImage({super.key, required this.scrollOffset});

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
              children: const [
                AppbarBackButton(),
                Text(
                  AppStrings.swipeDown,
                  style: TextStyle(color: Colors.white70), 
                ),
                CustomIconButton(icon: AppIcons.cart, count: 10),
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
                        "Vegan Olio Spaghetti Kit",
                        style: context.headlineSmall.copyWith(
                          fontWeight: FontThickness.semiBold,
                          color: AppColors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const FoodMarkSymbol(
                      foodMark: FoodMark.veg,
                      padding: 6,
                      circleSize: 8,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Enjoy a delicious, plant-based twist on a classic Italian favorite with our Vegan Olio Spaghetti Kit. Packed with high-quality durum wheat spaghetti, cold-pressed extra virgin olive oil, garlic flakes, chili flakes, and a blend of savory herbs.",
                  textAlign: TextAlign.justify,
                  style: context.bodySmall.copyWith(
                    color: AppColors.border,
                    fontSize: 11,
                    fontWeight: FontThickness.light,
                    height: 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 14),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MealDetailsIconTextspan(
                        icon: AppIcons.timer,
                        label: "23 mins.",
                      ),
                      MealDetailsIconTextspan(
                        icon: AppIcons.timer,
                        label: "2 pax.",
                      ),
                      MealDetailsIconTextspan(
                        icon: AppIcons.timer,
                        label: "320",
                      ),
                      MealDetailsIconTextspan(
                        icon: AppIcons.timer,
                        label: "Medium",
                      ),
                      MealDetailsIconTextspan(
                        icon: AppIcons.timer,
                        label: "Kit",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
