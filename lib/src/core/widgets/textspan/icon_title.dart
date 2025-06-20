import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class IconTitle extends StatelessWidget {
  final String label;
  final String? icon;
  final double? fontSize;
  const IconTitle({super.key, required this.label, this.fontSize, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: context.titleLarge.copyWith(
            color: AppColors.green,
            fontWeight: FontThickness.bold,
            fontSize: fontSize ?? 18,
          ),
        ),
        SizedBox(width: 5),
        SvgPicture.asset(icon ?? AppIcons.filter),
      ],
    );
  }
}
