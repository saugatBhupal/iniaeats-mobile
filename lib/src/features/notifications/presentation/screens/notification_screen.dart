import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/notifications/presentation/bloc/app_notification_bloc.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/app_bar/notification_appbar.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/card/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppbar(),
      body: GradientBackground(
        child: BlocBuilder<AppNotificationBloc, AppNotificationState>(
          builder: (context, state) {
            final notifications = context.read<AppNotificationBloc>().notification;

            if (notifications.isEmpty) {
              return const Center(
                child: Text(
                  'No notifications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                return NotificationCard(notificationType: notifications[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
