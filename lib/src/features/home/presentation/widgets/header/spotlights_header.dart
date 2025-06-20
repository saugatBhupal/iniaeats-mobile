import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class SpotlightsHeader extends StatelessWidget {
  const SpotlightsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          endIndent: context.width / 1.5,
          thickness: 2,
          color: AppColors.green.withValues(alpha: 0.65),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Image.asset(AppImages.spotlights, height: 52),
        ),
        Divider(
          indent: context.width / 1.5,
          thickness: 2,
          color: AppColors.green.withValues(alpha: 0.65),
        ),
      ],
    );
  }
}
