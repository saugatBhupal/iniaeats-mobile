import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class ReceivedTile extends StatelessWidget {
  const ReceivedTile({
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
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: context.width * 0.7),
                decoration: BoxDecoration(
                  color: AppColors.doctor,
                  border: Border.all(color: AppColors.genie),
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12.8,
                  ),
                  child: Text(
                    message,
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.black.withValues(alpha: 0.45),
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
                style: _textTheme.labelLarge!.copyWith(
                  color: AppColors.black.withValues(alpha: 0.45),
                  fontWeight: FontThickness.semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
