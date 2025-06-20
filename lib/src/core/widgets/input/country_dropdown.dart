import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class CountryDropdown extends StatelessWidget {
  final String? label;
  const CountryDropdown({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: "Nepal");

    return TextFormField(
      controller: _controller,
      readOnly: true,
      keyboardType: TextInputType.name,
      cursorColor: AppColors.grey,
      style: context.titleSmall.copyWith(color: AppColors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 14, right: 4),
          child: Image.asset(
            AppImages.nepalFlag,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SvgPicture.asset(
            AppIcons.dropdown,
            height: 8,
            width: 8,
            fit: BoxFit.scaleDown,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.4)),
        ),
        filled: true,
        fillColor: AppColors.grey.withValues(alpha: 0.05),
      ),
    );
  }
}
