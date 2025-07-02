import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class ReviewContainer extends StatelessWidget {
  final int starCount;
  const ReviewContainer({super.key, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$starCount.0 Stars ",
                  style: context.bodyLarge.copyWith(
                    color: AppColors.green,
                    fontWeight: FontThickness.bold,
                  ),
                ),
                TextSpan(
                  text: "(Based on 24 ratings)",
                  style: context.labelLarge.copyWith(
                    color: AppColors.black.withValues(alpha: 0.45),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          color: AppColors.turtle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(starCount, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(
                  AppIcons.rating,
                  height: 50,
                  colorFilter: const ColorFilter.mode(AppColors.green, BlendMode.srcIn),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
