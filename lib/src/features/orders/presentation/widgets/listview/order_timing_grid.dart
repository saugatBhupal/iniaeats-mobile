import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/timing_card.dart';

class OrderTimingGrid extends StatelessWidget {
  const OrderTimingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final timings = DeliveryTiming.values;
    final selected = context.watch<OrderBloc>().deliveryTiming;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "When do you want your order to be delivered?",
            style: context.bodySmall.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.semiBold,
            ),
          ),
        ),
        GridView.builder(
          padding: EdgeInsets.only(bottom: 20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: timings.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 2,
          ),
          itemBuilder: (context, index) {
            return TimingCard(
              deliveryTiming: timings[index],
              isSelected: selected == timings[index],
            );
          },
        ),
      ],
    );
  }
}
