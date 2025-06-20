import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final Color? start;
  final Color? end;

  const GradientBackground({
    super.key,
    required this.child,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [start ?? AppColors.white, end ?? AppColors.dew],
        ),
      ),
      child: child,
    );
  }
}
