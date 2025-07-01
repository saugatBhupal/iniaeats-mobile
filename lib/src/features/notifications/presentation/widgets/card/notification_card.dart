import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/date_time_utils.dart';
import 'package:inaeats/src/features/notifications/domain/entities/notification.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/tag/new_tag.dart';

class NotificationCard extends StatelessWidget {
  final NotificationType notificationType;
  const NotificationCard({super.key, required this.notificationType});

  @override
  Widget build(BuildContext context) {
    final AppNotification notification = notificationType.getNotification();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // color: AppColors.bento,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(notification.image, width: 70, height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.title, style: context.titleLarge.copyWith(fontSize: 20)),
                    Text(
                      formatCustomDate(notification.dateTime),
                      style: context.bodyLarge.copyWith(
                        color: AppColors.black.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
              if (notification.recent == true) ...[const Spacer(), const NewTag()],
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              notification.description,
              style: context.bodyLarge.copyWith(
                color: AppColors.black.withValues(alpha: 0.45),
                height: 1.1,
                letterSpacing: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
