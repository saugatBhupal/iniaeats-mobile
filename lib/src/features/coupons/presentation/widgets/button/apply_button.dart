import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.frog, AppColors.veggie],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(68, 199, 73, 0.35),
            offset: Offset(1, 1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Text(
        AppStrings.apply,
        style: context.bodyLarge.copyWith(color: AppColors.white),
      ),
    );
  }
}
