import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class DeliveryInfoCard extends StatelessWidget {
  const DeliveryInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: AppColors.doctor, borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuZ-z_R8SUqEfwaHhIGznkUo4UH7NeFb2Kvw&s",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text('Suresh Rajat', style: context.bodyLarge),
              Text(
                '981766431234',
                style: context.bodySmall.copyWith(
                  color: AppColors.black.withValues(alpha: 0.45),
                  fontWeight: FontThickness.medium,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.frog.withValues(alpha: 0.15),
              border: Border.all(color: AppColors.frog.withValues(alpha: 0.2)),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppIcons.phone),
          ),
        ],
      ),
    );
  }
}
