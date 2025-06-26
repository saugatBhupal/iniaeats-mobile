import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class AuthTextspan extends StatelessWidget {
  const AuthTextspan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.bodySmall.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
            letterSpacing: 0.2,
          ),
          children: [
            const TextSpan(text: "By signing up, you agree to our "),
            const TextSpan(
              text: "privacy policy",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: ", and "),
            const TextSpan(
              text: "terms & conditions",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: " of use"),
          ],
        ),
      ),
    );
  }
}
