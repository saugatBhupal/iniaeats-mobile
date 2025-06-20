import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class PhoneField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const PhoneField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodySmall.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          keyboardType: TextInputType.number,
          validator: validator,
          controller: controller,
          cursorColor: AppColors.grey,
          style: context.titleSmall.copyWith(color: AppColors.grey),
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 12),
              child: Text(
                AppStrings.code,
                style: context.titleSmall.copyWith(
                  fontWeight: FontThickness.medium,
                  color: AppColors.black.withValues(alpha: 0.6),
                ),
              ),
            ),
            hintText: hintText,
            hintStyle: context.titleSmall.copyWith(
              fontSize: 15,
              color: AppColors.black.withValues(alpha: 0.6),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey.withValues(alpha: 0.4),
              ),
            ),
            filled: true,
            fillColor: AppColors.grey.withValues(alpha: 0.05),
          ),
        ),
      ],
    );
  }
}
