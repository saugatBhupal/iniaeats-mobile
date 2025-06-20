import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class OtpTextspan extends StatelessWidget {
  final VoidCallback onChangeNumber;
  const OtpTextspan({super.key, required this.onChangeNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: context.bodySmall.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
          ),
          children: [
            const TextSpan(text: AppStrings.otpSentMessage),
            const TextSpan(text: "\n+977-9818733646. "),
            TextSpan(
              text: AppStrings.changeNumber,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.green,
              ),
              recognizer: TapGestureRecognizer()..onTap = onChangeNumber,
            ),
          ],
        ),
      ),
    );
  }
}
