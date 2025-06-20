import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class RecipeTextspan extends StatelessWidget {
  final String step;
  final int stepNumber;
  const RecipeTextspan({
    super.key,
    required this.step,
    required this.stepNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$stepNumber",
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontThickness.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Text(
                  step,
                  softWrap: true,
                  style: context.bodyLarge.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
