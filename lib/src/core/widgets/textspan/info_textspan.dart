import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class InfoTextspan extends StatelessWidget {
  final String info;
  final double? margin;
  final Color? color;
  const InfoTextspan({super.key, required this.info, this.margin, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: EdgeInsets.symmetric(vertical: margin ?? 18),
      decoration: BoxDecoration(
        color: color ?? AppColors.latte,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppIcons.info),
          SizedBox(width: 4),
          Text(
            info,
            style: context.bodySmall.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
