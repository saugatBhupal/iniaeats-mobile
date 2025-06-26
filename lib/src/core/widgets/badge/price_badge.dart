import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class PriceBadge extends StatelessWidget {
  const PriceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: AppColors.salmon, shape: BoxShape.circle),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: AppStrings.rupee,
              style: context.bodySmall.copyWith(color: AppColors.white),
            ),
            TextSpan(
              text: "299",
              style: context.bodyLarge.copyWith(
                fontWeight: FontThickness.medium,
                color: AppColors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
