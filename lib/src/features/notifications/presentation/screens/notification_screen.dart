import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/app_bar/notification_appbar.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/card/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppbar(),
      body: GradientBackground(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 13,
          separatorBuilder: (context, index) => SizedBox(height: 4),
          itemBuilder: (context, index) {
            return NotificationCard();
          },
        ),
      ),
    );
  }
}
