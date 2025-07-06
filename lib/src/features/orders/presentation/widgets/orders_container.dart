import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/symbols/dashed_line.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/orders_card.dart';

class OrdersContainer extends StatelessWidget {
  final ProductOrder order;
  final bool isFirst;
  const OrdersContainer({super.key, required this.order, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isFirst ? "Ongoing order" : "2 days ago",
            style: context.bodySmall.copyWith(
              color: AppColors.black.withAlpha(115),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          OrdersCard(order: order, isFirst: isFirst),
          const SizedBox(height: 10),
          const SizedBox(
            width: double.infinity,
            height: 1,
            child: DashedLine(color: AppColors.frog),
          ),
        ],
      ),
    );
  }
}
