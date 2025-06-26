import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class HomeCustomerService extends StatelessWidget {
  const HomeCustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 12);
    final List<String> customerService = [
      "We’re Always Improving – Tell Us What You Think!",
      "We're always working to improve your experience — from adding new meal kits and speeding up deliveries to enhancing quality and portion sizes. If you have any thoughts or feedback, we'd love to hear from you — every suggestion helps us grow and serve you better.",
      "Share your voice — we’re listening.",
      "Contact Customer Service",
    ];
    return Container(
      color: AppColors.darkgreen,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerService[0],
            style: context.bodyLarge.copyWith(color: AppColors.white, letterSpacing: 0),
          ),
          _gap,
          Text(
            customerService[1],
            textAlign: TextAlign.justify,
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontThickness.regular,
              letterSpacing: 0,
            ),
          ),
          _gap,
          Text(
            customerService[2],
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontThickness.semiBold,
              letterSpacing: 0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Text(
              customerService[3],
              style: context.bodySmall.copyWith(fontWeight: FontThickness.bold, letterSpacing: 0),
            ),
          ),
        ],
      ),
    );
  }
}
