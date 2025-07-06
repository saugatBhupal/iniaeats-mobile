import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class TrackOrderChip extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? titleColor;
  const TrackOrderChip({super.key, required this.title, this.bgColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: bgColor ?? AppColors.doctor, borderRadius: BorderRadius.circular(18.0)),
      child: Text(
        title,
        style: context.labelLarge.copyWith(
          color: titleColor ?? AppColors.black.withValues(alpha: 0.45),
          fontWeight: FontThickness.semiBold,
        ),
      ),
    );
  }
}
