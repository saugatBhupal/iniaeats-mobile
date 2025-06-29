import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/symbols/dashed_line.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/orders_card.dart';

class OrdersContainer extends StatelessWidget {
  const OrdersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ongoing order",
            style: context.bodySmall.copyWith(
              color: AppColors.black.withValues(alpha: 0.45),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          OrdersCard(),
          SizedBox(height: 10),
          DashedLine(color: AppColors.frog.withValues(alpha: 0.15)),
        ],
      ),
    );
  }
}
