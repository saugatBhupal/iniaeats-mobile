import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';

class TimerTextspan extends StatelessWidget {
  const TimerTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SvgPicture.asset(AppIcons.timer),
        SizedBox(width: 4),
        Text(
          "23 minutes",
          style: _textTheme.bodySmall!.copyWith(
            color: AppColors.black.withValues(alpha: 0.45),
          ),
        ),
      ],
    );
  }
}
