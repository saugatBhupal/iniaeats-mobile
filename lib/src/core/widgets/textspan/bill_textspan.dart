import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class BillTextspan extends StatelessWidget {
  final String label;
  final String amount;
  final Color? color;
  final double? fontSize;

  const BillTextspan({
    super.key,
    required this.label,
    required this.amount,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.bodySmall.copyWith(
              fontWeight: FontThickness.semiBold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${AppStrings.rupee} $amount",
            style: context.bodySmall.copyWith(
              fontWeight: FontThickness.semiBold,
              color: color ?? AppColors.green,
              fontSize: fontSize ?? 12,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
