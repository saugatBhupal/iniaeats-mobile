import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class TextspanField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? label;
  final String? icon;
  final String? hintText;
  final int minLines;
  const TextspanField({
    super.key,
    this.label,
    this.icon,
    this.hintText,
    this.validator,
    this.minLines = 5,
  });

  @override
  State<TextspanField> createState() => _TextspanFieldState();
}

class _TextspanFieldState extends State<TextspanField> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.multiline,
      cursorColor: AppColors.green,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: context.bodySmall.copyWith(
        color: AppColors.green.withValues(alpha: 0.8),
        fontWeight: FontThickness.semiBold,
      ),
      maxLines: null,
      minLines: widget.minLines,
      inputFormatters: [LengthLimitingTextInputFormatter(500)],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText:
            "Please mention any special requests, allergen issues, or ingredient exclusions here.",
        hintStyle: context.bodySmall.copyWith(
          color: AppColors.green.withValues(alpha: 0.8),
          fontWeight: FontThickness.semiBold,
        ),
        labelText: widget.label ?? widget.label,
        fillColor: AppColors.ceramic,
        labelStyle: context.bodySmall.copyWith(
          color: AppColors.green.withValues(alpha: 0.8),
          fontWeight: FontThickness.semiBold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.frog.withValues(alpha: 0.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.frog.withValues(alpha: 0.15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.frog.withValues(alpha: 0.15)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
