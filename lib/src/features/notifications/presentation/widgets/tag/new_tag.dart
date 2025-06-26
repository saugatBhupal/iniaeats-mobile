import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class NewTag extends StatelessWidget {
  const NewTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.frog, AppColors.veggie],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(68, 199, 73, 0.35),
            offset: const Offset(1, 1),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        "New",
        style: context.labelLarge.copyWith(
          color: AppColors.white,
          fontWeight: FontThickness.semiBold,
        ),
      ),
    );
  }
}
