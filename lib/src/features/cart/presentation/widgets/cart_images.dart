import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';

class CartImages extends StatelessWidget {
  const CartImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.cartCoupon),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
          child: Image.asset(AppImages.cartMessage),
        ),
      ],
    );
  }
}
