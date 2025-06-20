import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strawberry),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.close, color: AppColors.strawberry, size: 18),
          Text(
            AppStrings.clear,
            style: _textTheme.bodySmall!.copyWith(
              color: AppColors.strawberry,
              fontWeight: FontThickness.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
