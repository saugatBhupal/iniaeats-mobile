import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';
import 'package:inaeats/src/features/coupons/presentation/widgets/available_coupon_card.dart';
import 'package:inaeats/src/features/coupons/presentation/widgets/coupon_background.dart';

class CouponsScreen extends StatelessWidget {
  const CouponsScreen({super.key});
  List<Map<String, String>> get coupons => [
    {
      "couponName": "WELCOME10",
      "expiresIn": "56 hours 23 minutes",
      "offer": "25% OFF + Free Delivery",
    },
    {
      "couponName": "SUPER50",
      "expiresIn": "2 days 4 hours",
      "offer": "50% OFF on orders above रु500",
    },
    {
      "couponName": "FIRSTMEAL",
      "expiresIn": "1 day 12 hours",
      "offer": "Flat रु100 OFF + Free Delivery",
    },
    {
      "couponName": "WELCOME10",
      "expiresIn": "56 hours 23 minutes",
      "offer": "25% OFF + Free Delivery",
    },
    {
      "couponName": "SUPER50",
      "expiresIn": "2 days 4 hours",
      "offer": "50% OFF on orders above रु500",
    },
    {
      "couponName": "FIRSTMEAL",
      "expiresIn": "1 day 12 hours",
      "offer": "Flat रु100 OFF + Free Delivery",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: AppStrings.coupons),
      body: GradientBackground(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const CouponBackground(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 26),
                  const LeftTitle(title: "Available coupon codes"),
                  const InfoTextspan(info: AppStrings.couponInfo),
                  ...coupons.map(
                    (coupon) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AvailableCouponCard(
                        couponName: coupon["couponName"]!,
                        expiresIn: coupon["expiresIn"]!,
                        offer: coupon["offer"]!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
