import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/features/notifications/presentation/widgets/buttons/clear_button.dart';

class NotificationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: AppColors.border)),
        ),
        child: Row(
          children: [
            AppbarBackButton(),
            Text(
              AppStrings.notifications,
              style: _textTheme.titleLarge!.copyWith(
                fontWeight: FontThickness.bold,
                color: AppColors.green,
              ),
            ),
            Spacer(),
            ClearButton(),
          ],
        ),
      ),
    );
  }
}
