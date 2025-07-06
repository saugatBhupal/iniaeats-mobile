import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';

class OrderButton extends StatelessWidget {
  final Function()? onPressed;
  final List<Cart> cartItems;
  final int totalPayable;
  const OrderButton({
    super.key,
    this.onPressed,
    required this.cartItems,
    required this.totalPayable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
                    "Order ${cartItems.length} item${cartItems.length > 1 ? "s" : ""}",
                    style: context.bodyLarge.copyWith(
                      color: AppColors.white,
                      fontWeight: FontThickness.regular,
                    ),
                  ),
                  Text(
                    "${AppStrings.rupee}$totalPayable",
                    style: context.bodyLarge.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
