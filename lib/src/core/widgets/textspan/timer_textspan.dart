import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class TimerTextspan extends StatelessWidget {
  final int duration;
  const TimerTextspan({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.timer),
        SizedBox(width: 4),
        Text(
          "$duration minutes",
          style: context.bodySmall.copyWith(color: AppColors.black.withValues(alpha: 0.45)),
        ),
      ],
    );
  }
}
