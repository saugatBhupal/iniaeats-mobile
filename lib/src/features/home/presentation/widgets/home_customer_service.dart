import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class HomeCustomerService extends StatelessWidget {
  HomeCustomerService({super.key});

  final _gap = SizedBox(height: 12);
  static const _title = "We’re Always Improving – Tell Us What You Think!";
  static const _description =
      "We're always working to improve your experience — from adding new meal kits and speeding up deliveries to enhancing quality and portion sizes. If you have any thoughts or feedback, we'd love to hear from you — every suggestion helps us grow and serve you better.";
  static const _callToAction = "Share your voice — we’re listening.";
  static const _buttonLabel = "Contact Customer Service";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkgreen,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_title, style: context.bodyLarge.copyWith(color: AppColors.white, letterSpacing: 0)),
          _gap,
          Text(
            _description,
            textAlign: TextAlign.justify,
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontThickness.regular,
              letterSpacing: 0,
            ),
          ),
          _gap,
          Text(
            _callToAction,
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontThickness.semiBold,
              letterSpacing: 0,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.customerService),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Text(
                _buttonLabel,
                style: context.bodySmall.copyWith(fontWeight: FontThickness.bold, letterSpacing: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
