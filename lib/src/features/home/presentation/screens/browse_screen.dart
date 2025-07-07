import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/widgets/alerts/custom_alert_dialog.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [CustomAlertDialog(alertType: AlertType.order, title: "title", subtitle: "")],
        ),
      ),
    );
  }
}
