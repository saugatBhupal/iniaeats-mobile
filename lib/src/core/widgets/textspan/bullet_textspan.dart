import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class BulletTextspan extends StatelessWidget {
  final String label;
  const BulletTextspan({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(color: AppColors.frog, shape: BoxShape.circle),
        ),
        SizedBox(width: 4),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.visible,
          style: context.bodySmall.copyWith(color: AppColors.black.withValues(alpha: 0.45)),
        ),
      ],
    );
  }
}
