import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class LeftTitle extends StatelessWidget {
  final String title;
  final double? padding;
  const LeftTitle({super.key, required this.title, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding ?? 0.0),
      child: Text(
        title,
        style: context.titleLarge.copyWith(
          color: AppColors.black.withValues(alpha: 0.60),
        ),
      ),
    );
  }
}
