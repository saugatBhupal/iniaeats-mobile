import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class CustomAlertDialog extends StatefulWidget {
  final AlertType alertType;
  final String? title;
  final String? subtitle;
  const CustomAlertDialog({
    super.key,
    required this.alertType,
    required this.title,
    required this.subtitle,
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: const Duration(seconds: 4), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) {
              return CustomPaint(
                painter: _RotatingBorderPainter(
                  progress: _controller.value,
                  color: widget.alertType.shimmerColor,
                  titileColor: widget.alertType.titleColor,
                ),
              );
            },
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(7, 102, 83, 0.25),
                offset: const Offset(1, 1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(widget.alertType.iconPath, height: 40, width: 40),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.alertType.getTitle(coupon: widget.title!),
                    style: context.bodySmall.copyWith(
                      color: widget.alertType.titleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.alertType.getSubtitle(
                      item: widget.subtitle?.split(' ').take(2).join(' ') ?? '',
                    ),
                    style: context.labelLarge.copyWith(
                      color: widget.alertType.subColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RotatingBorderPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color titileColor;
  _RotatingBorderPainter({required this.progress, required this.color, required this.titileColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final borderRadius = 18.0;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final paint =
        Paint()
          ..shader = SweepGradient(
            startAngle: 0,
            endAngle: pi * 2,
            tileMode: TileMode.repeated,
            colors: [titileColor, color, color, titileColor],
            stops: [0.0, 0.4, 0.6, 1.0],

            transform: GradientRotation(2 * pi * progress),
          ).createShader(rect)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _RotatingBorderPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
