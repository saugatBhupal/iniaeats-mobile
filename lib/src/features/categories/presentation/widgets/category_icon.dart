import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class CategoryIcon extends StatelessWidget {
  final String label;
  final String image;
  const CategoryIcon({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.searchResults, arguments: label),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEAEFE4).withValues(alpha: 0.28),
              shape: BoxShape.circle,
            ),
            child: Image.asset(image, height: 70, width: 70),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: context.bodyLarge.copyWith(
              color: AppColors.black.withValues(alpha: 0.6),
              fontWeight: FontThickness.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
