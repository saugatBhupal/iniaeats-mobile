import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/tag/new_tag.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // color: AppColors.bento,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(AppImages.notification, width: 70, height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Successful!",
                      style: _textTheme.titleLarge!.copyWith(fontSize: 20),
                    ),
                    Text(
                      "19 Dev 2022 | 20:50 PM",
                      style: _textTheme.bodyLarge!.copyWith(
                        color: AppColors.black.withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              NewTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              "Your order has been successfully cancelled. For any concerns or assistance, our support team is ready to help via the Help Center.",
              style: _textTheme.bodyLarge!.copyWith(
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
