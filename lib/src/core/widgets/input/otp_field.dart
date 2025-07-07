import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';

class OtpField extends StatefulWidget {
  final List<TextEditingController> controllers;
  final FormFieldValidator<String>? validator;
  final String phone;

  const OtpField({
    super.key,
    required this.controllers,
    required this.phone,
    required this.validator,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  bool _isSubmitting = false;

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _submitOtp(String otp) {
    if (_isSubmitting) return;
    _isSubmitting = true;

    context.read<AuthenticationBloc>().add(
      VerifyOtp(dto: VerifyOtpRequestDto(phone: widget.phone, otp: otp)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: widget.validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(6, (index) {
                return Container(
                  width: context.width / 9,
                  height: 54,
                  margin: const EdgeInsets.only(right: 8),
                  child: TextField(
                    controller: widget.controllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: context.titleSmall!.copyWith(
                      fontSize: 18,
                      color: AppColors.black.withValues(alpha: 0.6),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.chalk,
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.border),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.red),
                      ),
                      errorText: field.hasError ? '' : null,
                      errorStyle: const TextStyle(height: 0, fontSize: 0),
                    ),

                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                      }

                      final otp = widget.controllers.map((c) => c.text).join();
                      field.didChange(otp);

                      if (otp.length == 6 && (widget.validator?.call(otp) == null)) {
                        _submitOtp(otp);
                      } else {
                        // Reset submission flag if not complete or invalid
                        _isSubmitting = false;
                      }
                    },
                  ),
                );
              }),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: AppColors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
