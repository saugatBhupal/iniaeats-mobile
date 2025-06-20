import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_textspan.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_title.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/login_form.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/otp_form.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/forms/register_form.dart';

class AuthenticationScreen extends StatelessWidget {
  final ValueNotifier<AuthType> authTypeNotifier;

  AuthenticationScreen({super.key, required AuthType authType})
    : authTypeNotifier = ValueNotifier<AuthType>(authType);

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
                child: Image.asset(
                  AppImages.authentication,
                  fit: BoxFit.contain,
                ),
              ),

              ValueListenableBuilder<AuthType>(
                valueListenable: authTypeNotifier,
                builder: (context, authType, _) {
                  return AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 42,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(52),
                          topRight: Radius.circular(52),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.10),
                            offset: const Offset(1, 1),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AuthTitle(),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder:
                                (child, animation) => FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                            child: _buildForm(authType),
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

  Widget _buildForm(AuthType authType) {
    switch (authType) {
      case AuthType.login:
        return LoginForm(
          key: const ValueKey('LoginForm'),
          onOtpRequested: () => authTypeNotifier.value = AuthType.otp,
        );
      case AuthType.register:
        return const RegisterForm(key: ValueKey('RegisterForm'));
      case AuthType.otp:
        return OtpForm(
          key: const ValueKey('OtpForm'),
          onChangeNumber: () => authTypeNotifier.value = AuthType.login,
        );
    }
  }
}
