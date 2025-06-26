import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class SentTile extends StatelessWidget {
  const SentTile({
    super.key,
    required this.message,
    required this.sent,
    this.profileImage,
    this.username,
  });

  final String message;
  final String sent;
  final String? profileImage;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: context.width * 0.7),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: const BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.8),
                      child: Text(
                        message,
                        style: context.bodySmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontThickness.semiBold,
                          fontSize: 12,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sent,
                    style: context.labelLarge!.copyWith(
                      color: AppColors.black.withValues(alpha: 0.45),
                      fontWeight: FontThickness.semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
