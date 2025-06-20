import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final String? icon;
  final double? fontSize;
  final double? height;
  final bool isLoading;
  final bool isEnabled;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

  const AuthButton({
    super.key,
    required this.title,
    this.onPressed,
    this.fontSize,
    this.padding,
    this.height,
    this.icon,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool showAsDisabled = !isEnabled || onPressed == null;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: height,
      decoration: BoxDecoration(
        color: showAsDisabled ? const Color.fromRGBO(224, 224, 224, 1) : AppColors.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: showAsDisabled ? null : onPressed,
          splashColor: AppColors.green.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(6),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) Image.asset(icon!, height: 24.0, width: 24.0),
                Container(
                  padding:
                      padding ??
                      (context.isTablet
                          ? const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          )
                          : const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          )),
                  child:
                      isLoading
                          ? const CupertinoActivityIndicator(
                            color: Colors.white,
                            animating: true,
                          )
                          : Text(
                            title,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontThickness.medium,
                              letterSpacing: 0,
                              fontSize:
                                  fontSize ?? (context.isTablet ? 22 : 18),
                            ),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
