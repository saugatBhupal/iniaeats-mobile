import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        hintText: AppStrings.searchPH,
      
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: AppColors.border),
          ),
        ),
        hintStyle: WidgetStatePropertyAll(
          context.bodySmall.copyWith(color: AppColors.grey.withValues(alpha: 0.5)),
        ),
        textStyle: WidgetStatePropertyAll(
          context.titleSmall.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
        ),
        leading: SvgPicture.asset(AppIcons.search, width: 20, height: 20),
      ),
    );
  }
}
