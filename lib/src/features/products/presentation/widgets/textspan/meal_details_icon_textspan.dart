import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class MealDetailsIconTextspan extends StatelessWidget {
  final String label;
  final String icon;
  const MealDetailsIconTextspan({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bool isSvg = icon.toLowerCase().endsWith('.svg');

    return Row(
      children: [
        isSvg
            ? SvgPicture.asset(icon, colorFilter: ColorFilter.mode(AppColors.frog, BlendMode.srcIn))
            : Image.asset(icon, color: AppColors.frog, height: 22),
        const SizedBox(width: 4),
        Text(
          label,
          style: context.bodySmall.copyWith(color: AppColors.white.withValues(alpha: 0.85)),
        ),
      ],
    );
  }
}
