import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';

class CouponBackground extends StatelessWidget {
  const CouponBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 402 / 179,
      child: Image.asset(AppImages.cartCoupon, fit: BoxFit.cover),
    );
  }
}
