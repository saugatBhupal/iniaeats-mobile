import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';

class CategoriesAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 12, left: 16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: AppColors.border)),
        ),
        child: Row(
          children: [
            AppbarBackButton(),
            Text(
              AppStrings.moreCat,
              style: _textTheme.titleLarge!.copyWith(
                fontWeight: FontThickness.bold,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
