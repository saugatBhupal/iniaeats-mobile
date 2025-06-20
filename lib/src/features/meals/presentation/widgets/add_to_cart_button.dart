import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class AddToCartButton extends StatelessWidget {
  final Function()? onPressed;
  const AddToCartButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2,
      padding: EdgeInsets.symmetric(vertical: 8),
      color: AppColors.white,
      child: Material(
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.mint,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add to cart",
                  style: context.bodyLarge.copyWith(
                    color: AppColors.white,
                    fontWeight: FontThickness.regular,
                  ),
                ),
                Text(
                  "${AppStrings.rupee}200.00",
                  style: context.bodyLarge.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
