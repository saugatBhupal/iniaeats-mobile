import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class AddressCard extends StatelessWidget {
  final String addressType;
  final String address;

  const AddressCard({super.key, required this.addressType, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.frog.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(addressType, style: context.bodyLarge.copyWith(color: AppColors.green, height: 1.2)),
          Text(
            address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(
              color: AppColors.green.withValues(alpha: 0.8),
              fontWeight: FontThickness.medium,
            ),
          ),
        ],
      ),
    );
  }
}
