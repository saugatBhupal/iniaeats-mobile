import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';
import 'package:inaeats/src/features/cart/domain/entities/coupon.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:inaeats/src/features/coupons/presentation/widgets/available_coupon_card.dart';
import 'package:inaeats/src/features/coupons/presentation/widgets/coupon_background.dart';

class CouponsScreen extends StatelessWidget {
  CouponsScreen({super.key});
  final List<Coupon> coupons = [
    Coupon(
      code: "WELCOME10",
      discountValue: 25,
      discountType: DiscountType.percent,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "25% OFF + Free Delivery",
    ),
    Coupon(
      code: "SUPER50",
      discountValue: 50,
      discountType: DiscountType.percent,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "50% OFF on orders above रु500",
    ),
    Coupon(
      code: "FIRSTMEAL",
      discountValue: 100,
      discountType: DiscountType.amount,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "Flat रु100 OFF + Free Delivery",
    ),
    Coupon(
      code: "WELCOME10",
      discountValue: 25,
      discountType: DiscountType.percent,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "25% OFF + Free Delivery",
    ),
    Coupon(
      code: "SUPER50",
      discountValue: 250,
      discountType: DiscountType.amount,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "Flat रु250 OFF on orders above रु500",
    ),
    Coupon(
      code: "FIRSTMEAL",
      discountValue: 100,
      discountType: DiscountType.amount,
      expiresIn: DateTime.parse("2025-07-05T12:00:00.000Z"),
      offer: "Flat रु100 OFF + Free Delivery",
    ),
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
                        coupon: coupon,
                        onCouponSelected: (value) {
                          context.read<CartBloc>().add(ApplyCoupon(coupon: coupon));
                          Navigator.of(context).pop();
                        },
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
