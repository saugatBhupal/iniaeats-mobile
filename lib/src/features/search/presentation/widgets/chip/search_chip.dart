import 'package:flutter/material.dart';

import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class SearchChip extends StatelessWidget {
  final String label;
  final Color? border;
  final Color? background;
  const SearchChip({super.key, required this.label, this.background, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: background ?? AppColors.doctor,
        border: Border.all(color: border ?? AppColors.genie),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        label,
        style: context.bodySmall.copyWith(
          color: border ?? AppColors.black.withValues(alpha: 0.45),
          fontWeight: FontThickness.semiBold,
        ),
      ),
    );
  }
}
