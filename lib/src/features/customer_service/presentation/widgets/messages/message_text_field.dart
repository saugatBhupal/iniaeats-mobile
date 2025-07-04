import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSend;
  const MessageTextField({super.key, required this.onSend, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      child: TextFormField(
        onFieldSubmitted: onSend,
        controller: controller,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.black,
        style: context.titleSmall.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
          filled: true,
          fillColor: AppColors.white,
          hintText: "Type your message.....",
          hintStyle: context.bodySmall!.copyWith(
            color: Color(0xFFB1B1B1),
            fontWeight: FontThickness.semiBold,
          ),

          suffixIcon: GestureDetector(
            onTap: () {
              if (onSend != null) {
                onSend!(controller.text);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: SvgPicture.asset(AppIcons.send),
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: Color(0xFFB1B1B1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: Color(0xFFB1B1B1)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
            borderSide: const BorderSide(color: Color(0xFFB1B1B1)),
          ),
        ),
      ),
    );
  }
}
