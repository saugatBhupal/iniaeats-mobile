import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/badge/price_badge.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/core/widgets/symbols/ratings_symbol.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/timer_textspan.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(width: 8.0);
    return Container(
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
                Positioned(top: -8, left: -6, child: PriceBadge()),
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
                _gap,
                BulletTextspan(label: "320 Kcal"),
                _gap,
                BulletTextspan(label: "Lunch"),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Text(
                  "Italian",
                  style: context.bodySmall!.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
                  ),
                ),
                _gap,
                Text(
                  "Meal-Kit",
                  style: context.bodySmall!.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
                  ),
                ),
                _gap,
                Text(
                  "Easy",
                  style: context.bodySmall!.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
                  ),
                ),
                _gap,
                Text(
                  "Veg & Vegan",
                  style: context.bodySmall!.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
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
