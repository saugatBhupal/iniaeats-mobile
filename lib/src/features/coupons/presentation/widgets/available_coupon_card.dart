import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/date_time_utils.dart';
import 'package:inaeats/src/features/cart/domain/entities/coupon.dart';
import 'package:inaeats/src/features/coupons/presentation/widgets/button/apply_button.dart';

class AvailableCouponCard extends StatelessWidget {
  final Coupon coupon;
  final ValueChanged<Coupon> onCouponSelected;
  const AvailableCouponCard({super.key, required this.coupon, required this.onCouponSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(68, 199, 73, 0.15),
            Color.fromRGBO(68, 199, 73, 0.10),
            Color.fromRGBO(255, 255, 255, 0.00),
          ],
          stops: [0.0, 0.2, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coupon.code, style: context.bodyLarge.copyWith(color: AppColors.green)),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.expires,
                        style: context.bodyLarge.copyWith(
                          color: AppColors.black.withValues(alpha: 0.45),
                          fontWeight: FontThickness.regular,
                        ),
                      ),
                      TextSpan(
                        text: formatExpiry(coupon.expiresIn),
                        style: context.bodyLarge.copyWith(color: AppColors.bento),
                      ),
                    ],
                  ),
                ),
                Text(
                  coupon.offer,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: context.bodyLarge.copyWith(color: AppColors.frog),
                ),
              ],
            ),
          ),
          ApplyButton(
            onPressed: () {
              onCouponSelected(coupon);
            },
          ),
        ],
      ),
    );
  }
}
