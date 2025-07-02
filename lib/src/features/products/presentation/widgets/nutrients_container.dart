import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';

class NutrientsContainer extends StatelessWidget {
  final int protein;
  final int weight;
  final int fats;
  final int carbs;

  const NutrientsContainer({
    super.key,
    required this.protein,
    required this.weight,
    required this.fats,
    required this.carbs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: IconTitle(label: AppStrings.nutirents, fontSize: 14),
        ),
        Container(
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          color: AppColors.turtle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NutrientItem(label: 'Protein', value: protein),
              _NutrientItem(label: 'Weight', value: weight),
              _NutrientItem(label: 'Fats', value: fats),
              _NutrientItem(label: 'Carbs', value: carbs),
            ],
          ),
        ),
      ],
    );
  }
}

class _NutrientItem extends StatelessWidget {
  final String label;
  final int value;

  const _NutrientItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: context.bodySmall.copyWith(
            fontWeight: FontThickness.semiBold,
            color: AppColors.green,
          ),
        ),
        const SizedBox(height: 4),
        Text("${value}g", style: context.titleLarge.copyWith(color: AppColors.green)),
      ],
    );
  }
}
