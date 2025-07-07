import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/widgets/alerts/custom_alert_dialog.dart';

void showCustomAlertOverlay(
  BuildContext context, {
  required AlertType type,
  String? title,
  String? subtitle,
  Duration duration = const Duration(seconds: 2),
}) {
  final overlay = Overlay.of(context);
  if (overlay == null) return;

  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          bottom: 80,
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: CustomAlertDialog(alertType: type, title: title ?? '', subtitle: subtitle ?? ''),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(duration, () {
    overlayEntry.remove();
  });
}
