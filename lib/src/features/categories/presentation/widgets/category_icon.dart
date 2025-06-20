import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';

class CategoryIcon extends StatelessWidget {
  final String label;
  final String image;
  const CategoryIcon({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Image.asset(image, height: 70, width: 70),
        Text(
          label,
          textAlign: TextAlign.center,
          style: _textTheme.bodyLarge!.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
            fontWeight: FontThickness.semiBold,
          ),
        ),
      ],
    );
  }
}
