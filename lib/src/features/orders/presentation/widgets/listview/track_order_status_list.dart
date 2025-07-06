import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/track_order_chip.dart';

class TrackOrderStatusList extends StatelessWidget {
  const TrackOrderStatusList({super.key});
  static const List<String> status = [
    "Order placed",
    "Order is being prepared",
    "Order En-Route",
    "Order Delivered",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: status.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: TrackOrderChip(
              title: status[index],
              bgColor:
                  index == 0
                      ? AppColors.frog.withValues(alpha: 0.15)
                      : index == 1
                      ? AppColors.salmon.withValues(alpha: 0.15)
                      : null,
              titleColor:
                  index == 0
                      ? AppColors.green
                      : index == 1
                      ? AppColors.salmon
                      : null,
            ),
          );
        },
      ),
    );
  }
}
