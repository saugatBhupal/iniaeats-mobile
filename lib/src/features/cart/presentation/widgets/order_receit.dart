import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/bill_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';

class OrderReceit extends StatelessWidget {
  const OrderReceit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 38),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftTitle(title: AppStrings.orderReceipt),
          InfoTextspan(info: AppStrings.orderInfo),
          BillTextspan(label: AppStrings.totalPrice, amount: "1233"),
          BillTextspan(label: AppStrings.vat, amount: "13"),
          BillTextspan(label: AppStrings.deliveryCharge, amount: "120"),
          BillTextspan(
            label: AppStrings.promoDiscount,
            amount: "1233",
            color: AppColors.bento,
          ),
          Divider(color: AppColors.frog.withValues(alpha: 0.25)),
          BillTextspan(
            label: AppStrings.totalPayable,
            amount: "1233",
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
