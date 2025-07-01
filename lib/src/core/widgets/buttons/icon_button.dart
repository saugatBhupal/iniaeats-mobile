import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final int count;
  final Function()? onTap;
  const CustomIconButton({super.key, required this.icon, required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 1.2),
            ),
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(icon),
          ),
          Positioned(
            top: -4,
            right: -4,
            child: Badge(
              label: Text(count > 9 ? '9+' : '$count'),
              backgroundColor: AppColors.bento,
              alignment: Alignment.center,
              smallSize: 18,
              textStyle: context.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
