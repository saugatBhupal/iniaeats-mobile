import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';

class NutrientsContainer extends StatelessWidget {
  const NutrientsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: IconTitle(label: AppStrings.nutirents, fontSize: 14),
        ),
        Container(
          color: AppColors.turtle,
          width: context.width,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Protein",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "230g",
                    style: context.titleLarge.copyWith(color: AppColors.green),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Weight",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "530g",
                    style: context.titleLarge.copyWith(color: AppColors.green),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Fat",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "30g",
                    style: context.titleLarge.copyWith(color: AppColors.green),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Carbs",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "1230g",
                    style: context.titleLarge.copyWith(color: AppColors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
