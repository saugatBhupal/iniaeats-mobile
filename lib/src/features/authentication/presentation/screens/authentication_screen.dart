import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_state.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_textspan.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_title.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/login_form.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/otp_form.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/register_form.dart';

class AuthenticationScreen extends StatelessWidget {
  final ValueNotifier<AuthState> authStateNotifier;

  AuthenticationScreen({super.key, required AuthType authType})
    : authStateNotifier = ValueNotifier<AuthState>(AuthState(authType: authType));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        start: AppColors.enoki,
        end: AppColors.mint,
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(AppImages.authentication, fit: BoxFit.contain),
              ),
              ValueListenableBuilder<AuthState>(
                valueListenable: authStateNotifier,
                builder: (context, state, _) {
                  return AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(52),
                          topRight: Radius.circular(52),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            offset: const Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthTitle(),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _buildForm(state),
                          ),
                          const AuthTextspan(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(AuthState state) {
    switch (state.authType) {
      case AuthType.login:
        return LoginForm(
          key: const ValueKey('LoginForm'),
          onOtpRequested: (phone, expiryTime) {
            authStateNotifier.value = state.copyWith(
              authType: AuthType.otp,
              phone: phone,
              expiryTime: expiryTime,
            );
          },
        );
      case AuthType.register:
        return RegisterForm(key: ValueKey('RegisterForm'), phone: state.phone);
      case AuthType.otp:
        return OtpForm(
          key: const ValueKey('OtpForm'),
          phone: state.phone,
          expiryTime: state.expiryTime,
          onFormRequested: (AuthType type) {
            authStateNotifier.value = state.copyWith(authType: type);
          },
        );
    }
  }
}
