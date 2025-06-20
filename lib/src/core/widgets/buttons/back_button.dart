import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';

class AppbarBackButton extends StatelessWidget {
  const AppbarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(Icons.arrow_back_rounded, color: AppColors.green, size: 24),
      ),
    );
  }
}
