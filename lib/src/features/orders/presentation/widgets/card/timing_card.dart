import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class TimingCard extends StatelessWidget {
  final String title;
  final String timing;
  final String message;

  const TimingCard({super.key, required this.title, required this.timing, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.frog.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: context.bodyLarge.copyWith(color: AppColors.green, height: 1.2),
                ),
                TextSpan(
                  text: timing,
                  style: context.bodySmall.copyWith(color: AppColors.green, height: 1.2),
                ),
              ],
            ),
          ),
          Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(
              color: AppColors.green.withValues(alpha: 0.8),
              fontWeight: FontThickness.medium,
            ),
          ),
        ],
      ),
    );
  }
}
