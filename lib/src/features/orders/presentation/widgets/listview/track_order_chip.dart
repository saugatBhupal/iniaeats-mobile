import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class TrackOrderChip extends StatelessWidget {
  const TrackOrderChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: AppColors.doctor, borderRadius: BorderRadius.circular(18.0)),
      child: Text(
        "Order placed",
        style: context.labelLarge.copyWith(
          color: AppColors.black.withValues(alpha: 0.45),
          fontWeight: FontThickness.semiBold,
        ),
      ),
    );
  }
}
