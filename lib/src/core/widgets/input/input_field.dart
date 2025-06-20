import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?> validator;
  const InputField({
    super.key,
    required this.label,
    this.hintText,
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
          keyboardType: TextInputType.name,
          cursorColor: AppColors.grey,
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
