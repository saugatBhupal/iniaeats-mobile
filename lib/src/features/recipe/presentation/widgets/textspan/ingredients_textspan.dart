import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/symbols/dashed_line.dart';

class IngredientsTextspan extends StatelessWidget {
  final String ingredient;
  const IngredientsTextspan({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
              ),
              SizedBox(width: 14),
              Text(
                ingredient,
                style: context.bodyLarge.copyWith(color: AppColors.black.withValues(alpha: 0.45)),
              ),
            ],
          ),
          SizedBox(height: 16),
          DashedLine(),
        ],
      ),
    );
  }
}
