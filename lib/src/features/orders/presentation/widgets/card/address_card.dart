import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';

class AddressCard extends StatelessWidget {
  final AddressType addressType;
  final String address;
  final bool isSelected;
  final VoidCallback? onTap;

  const AddressCard({
    super.key,
    required this.addressType,
    required this.address,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? AppColors.frog.withValues(alpha: 0.15) : AppColors.porcelian;
    final titleColor = isSelected ? AppColors.green : AppColors.black.withValues(alpha: 0.6);
    final subColor =
        isSelected
            ? AppColors.green.withValues(alpha: 0.8)
            : AppColors.black.withValues(alpha: 0.45);

    return GestureDetector(
      onTap: () => context.read<OrderBloc>().add(SelectAddress(addressType)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.green.withValues(alpha: 0.14) : Colors.transparent,
            width: 0.6,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              addressType.displayName,
              style: context.bodyLarge.copyWith(color: titleColor, height: 1.2),
            ),
            Text(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall.copyWith(color: subColor, fontWeight: FontThickness.medium),
            ),
          ],
        ),
      ),
    );
  }
}
