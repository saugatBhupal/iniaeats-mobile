import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/badge/price_badge.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/core/widgets/symbols/ratings_symbol.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/timer_textspan.dart';

class MealTabCard extends StatelessWidget {
  final String mealTimel;
  const MealTabCard({super.key, required this.mealTimel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Positioned(top: -8, left: -5, child: PriceBadge()),
              ],
            ),
          ),

          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Olio Spaghetti Kit", style: context.titleMedium),
                SizedBox(width: 6),
                const FoodMarkSymbol(foodMark: FoodMark.veg),
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
                TimerTextspan(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BulletTextspan(label: "320 Kcal"),
                ),
                BulletTextspan(label: mealTimel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
