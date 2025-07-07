import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/widgets/input/otp_field.dart';
import 'package:inaeats/src/core/widgets/snackbar/app_snackbar_alert.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/expiry_countdown.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/otp_textspan.dart';

class OtpForm extends StatefulWidget {
  final void Function(AuthType) onFormRequested;
  final String phone;
  final String expiryTime;

  const OtpForm({
    super.key,
    required this.onFormRequested,
    required this.phone,
    required this.expiryTime,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;
  final List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess && state.dto.user.hasRegistered == true) {
          showCustomAlertOverlay(context, type: AlertType.welcome);
          Navigator.of(context).pushNamed(AppRoutes.home);
        }
        if (state is VerifyOtpSuccess && state.dto.user.hasRegistered == false) {
          widget.onFormRequested(AuthType.register);
        }
        if (state is GetOtpSuccess) {
          buildToast(toastType: ToastType.success, msg: state.dto.message);
        }
        if (state is VerifyOtpError) {
          setState(() {
            errorMessage = state.message;
          });
          _formKey.currentState?.validate();
          setState(() {
            errorMessage = null;
          });
        }
      },
      child: SingleChildScrollView(
        child: Container(
          height: context.height / 2.5,
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OtpTextspan(
                onChangeNumber: () => widget.onFormRequested(AuthType.login),
                phone: widget.phone,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 12),
                  child: OtpField(
                    controllers: controllers,
                    phone: widget.phone,
                    validator: (value) => errorMessage,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:
                        () => context.read<AuthenticationBloc>().add(GetOtp(phone: widget.phone)),
                    child: Text(
                      "Resend OTP",
                      style: context.bodySmall.copyWith(
                        color: AppColors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  ExpiryCountdown(
                    expiryTimeString: widget.expiryTime,
                    onExpired: () {
                      context.read<AuthenticationBloc>().add(GetOtp(phone: widget.phone));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
