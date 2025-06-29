import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class OrderCardInfoTextspan extends StatelessWidget {
  const OrderCardInfoTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Olio Spaghetti", style: context.displaySmall.copyWith(fontSize: 30)),
        Text(
          "Immediate Delivery (45 min -1hr)",
          style: context.bodySmall.copyWith(color: AppColors.white),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.location),
            const SizedBox(width: 8),
            Text(
              "Home, Rabi bhawan, Kathmandu",
              style: context.bodySmall.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ],
    );
  }
}
