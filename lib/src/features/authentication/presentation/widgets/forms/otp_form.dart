import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/input/otp_field.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/otp_textspan.dart';

class OtpForm extends StatefulWidget {
  final VoidCallback onChangeNumber;
  const OtpForm({super.key, required this.onChangeNumber});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2.5,
      padding: EdgeInsets.symmetric(vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OtpTextspan(onChangeNumber: widget.onChangeNumber),
          Padding(
            padding: EdgeInsets.only(top: 6, bottom: 12),
            child: OtpField(controllers: controllers),
          ),
          Text(
            "Resend OTP",
            style: context.bodySmall.copyWith(
              color: AppColors.green,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
