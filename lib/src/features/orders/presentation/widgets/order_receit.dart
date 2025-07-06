import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/symbols/dashed_line.dart';
import 'package:inaeats/src/core/widgets/textspan/bill_textspan.dart';

class OrderReceit extends StatelessWidget {
  final int totalPrice;
  const OrderReceit({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashedLine(color: AppColors.frog.withValues(alpha: 0.15)),
          SizedBox(height: 14),
          Text(
            "Order Receit",
            style: context.titleLarge.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
          ),
          SizedBox(height: 8),
          BillTextspan(label: AppStrings.totalPayable, amount: totalPrice.toString(), fontSize: 14),
          SizedBox(height: 8),
          DashedLine(color: AppColors.frog.withValues(alpha: 0.15)),
        ],
      ),
    );
  }
}
