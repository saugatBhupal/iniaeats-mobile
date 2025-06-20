import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class EmailField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  const EmailField({
    super.key,
    this.hintText,
    required this.label,
    required this.controller,
    required this.validator,
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
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          validator: validator,
          cursorColor: AppColors.grey,
          keyboardType: TextInputType.emailAddress,
          style: context.titleSmall.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.titleSmall.copyWith(
              fontSize: 15,
              color: AppColors.black.withValues(alpha: 0.6),
            ),
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
