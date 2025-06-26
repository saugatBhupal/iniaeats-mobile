import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class OtpTextspan extends StatefulWidget {
  final VoidCallback onChangeNumber;
  final String phone;

  const OtpTextspan({super.key, required this.onChangeNumber, required this.phone});

  @override
  State<OtpTextspan> createState() => _OtpTextspanState();
}

class _OtpTextspanState extends State<OtpTextspan> {
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = widget.onChangeNumber;
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: context.bodySmall.copyWith(color: AppColors.black.withAlpha(150)),
          children: [
            const TextSpan(text: AppStrings.otpSentMessage),
            TextSpan(text: "\n+${widget.phone}. "),
            TextSpan(
              text: AppStrings.changeNumber,
              style: const TextStyle(decoration: TextDecoration.underline, color: AppColors.green),
              recognizer: _tapGestureRecognizer,
            ),
          ],
        ),
      ),
    );
  }
}
