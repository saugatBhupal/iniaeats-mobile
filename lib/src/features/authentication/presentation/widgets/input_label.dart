import 'package:flutter/material.dart';

import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class InputLabel extends StatelessWidget {
  final String label;
  const InputLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(
        label,
        style: context.bodySmall.copyWith(
          color: AppColors.black.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
