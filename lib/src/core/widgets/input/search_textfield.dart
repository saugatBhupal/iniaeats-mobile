import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      readOnly: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: AppColors.white,
        hintText: AppStrings.searchPH,
        hintStyle: _textTheme.bodySmall!.copyWith(
          color: AppColors.grey.withValues(alpha: 0.5),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset(AppIcons.search, width: 20, height: 20),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
