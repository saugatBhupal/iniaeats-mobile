import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/delivery_info_card.dart';

class OrderDeliveryInfo extends StatelessWidget {
  const OrderDeliveryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your order is being delivered by",
            style: context.bodySmall.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.semiBold,
            ),
          ),
          DeliveryInfoCard(),
          Text(
            "Orders cannot be cancelled once confirmed by the user",
            style: context.bodySmall.copyWith(
              color: AppColors.bento,
              fontWeight: FontThickness.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
