import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/order_items_list.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/track_order_status_list.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/order_delivery_info.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/order_receit.dart';

class TrackOrderScrollableSheet extends StatelessWidget {
  final ProductOrder order;
  const TrackOrderScrollableSheet({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.43,
      minChildSize: 0.43,
      maxChildSize: 0.80,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(bottom: 24, left: 6, right: 6),
          decoration: BoxDecoration(
            color: AppColors.ceramic,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.12),
                offset: Offset(1, 1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTextspan(info: AppStrings.peakHourMsg, color: AppColors.ceramic, margin: 14),
                TrackOrderStatusList(),
                OrderItemsList(products: order.cart.map((cart) => cart.product).toList()),
                OrderReceit(totalPrice: order.totalPrice),
                OrderDeliveryInfo(),
              ],
            ),
          ),
        );
      },
    );
  }
}
