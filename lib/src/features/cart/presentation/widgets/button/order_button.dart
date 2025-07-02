import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';

class OrderButton extends StatelessWidget {
  final Function()? onPressed;
  const OrderButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final _cartBloc = context.watch<CartBloc>();
    final cartItems = _cartBloc.cartItems;
    final summary = _cartBloc.summary;
    return Container(
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
                  "${AppStrings.rupee}${summary.totalPayable}",
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
