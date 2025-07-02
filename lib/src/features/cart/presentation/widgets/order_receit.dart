import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/bill_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';

class OrderReceit extends StatelessWidget {
  const OrderReceit({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartBloc>().cartItems;
    if (cartItems.isEmpty) {
      return const SizedBox();
    }
    final summary = context.watch<CartBloc>().summary;
    return Container(
      margin: EdgeInsets.only(bottom: 38),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftTitle(title: AppStrings.orderReceipt),
          InfoTextspan(info: AppStrings.orderInfo),
          BillTextspan(label: AppStrings.totalPrice, amount: summary.subtotal.toString()),
          BillTextspan(label: AppStrings.vat, amount: summary.vat.toString()),
          BillTextspan(label: AppStrings.deliveryCharge, amount: summary.deliveryFee.toString()),
          if (summary.discount > 0)
            BillTextspan(label: AppStrings.promoDiscount, amount: summary.discount.toString()),
          Divider(color: AppColors.frog.withValues(alpha: 0.25)),
          BillTextspan(
            label: AppStrings.totalPayable,
            amount: summary.totalPayable.toString(),
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
