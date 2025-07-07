import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class OrderCardInfoTextspan extends StatelessWidget {
  final String productName;
  final DeliveryTiming deliveryTiming;
  final String address;
  const OrderCardInfoTextspan({
    super.key,
    required this.productName,
    required this.deliveryTiming,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(productName, style: context.displaySmall.copyWith(fontSize: 30), maxLines: 1),
        Text(
          deliveryTiming.displayTiming[0] + deliveryTiming.displayTiming[1],
          style: context.bodySmall.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppIcons.location),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                address,
                maxLines: 2,
                softWrap: true,
                style: context.bodySmall.copyWith(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
