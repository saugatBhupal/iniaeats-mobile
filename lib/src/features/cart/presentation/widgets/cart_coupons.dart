import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class CartCoupons extends StatelessWidget {
  const CartCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.coupons),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.frog, AppColors.veggie],
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(68, 199, 73, 0.35),
              offset: Offset(1, 1),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: Image.asset(AppIcons.coupon, height: 28, width: 28),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.applyCoupon,
                  style: context.titleMedium.copyWith(color: AppColors.white, height: 1.4),
                ),
                Text(
                  "0 ${AppStrings.couponSelected}",
                  style: context.bodySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontThickness.medium,
                  ),
                ),
              ],
            ),

            Spacer(),
            Transform.rotate(
              angle: -math.pi,
              child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
