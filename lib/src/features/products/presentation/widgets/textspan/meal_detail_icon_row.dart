import 'package:flutter/material.dart';

import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/features/products/presentation/widgets/textspan/meal_details_icon_textspan.dart';

class MealDetailIconRow extends StatelessWidget {
  final int duration;
  final int portion;
  final int calories;
  final String difficulty;
  final String productType;

  const MealDetailIconRow({
    super.key,
    required this.duration,
    required this.portion,
    required this.calories,
    required this.difficulty,
    required this.productType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MealDetailsIconTextspan(icon: AppIcons.timer, label: "$duration mins."),
          MealDetailsIconTextspan(icon: AppIcons.pax, label: "$portion pax."),
          MealDetailsIconTextspan(icon: AppIcons.kcal, label: "$calories"),
          MealDetailsIconTextspan(
            icon: AppIcons.difficulty,
            label: difficulty[0].toUpperCase() + difficulty.substring(1),
          ),
          MealDetailsIconTextspan(icon: AppIcons.bento, label: productType),
        ],
      ),
    );
  }
}
