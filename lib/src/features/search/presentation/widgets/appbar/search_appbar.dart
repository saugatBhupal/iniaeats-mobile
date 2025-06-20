import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/core/widgets/input/search_textfield.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(120);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(bottom: 12, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                AppbarBackButton(),
                Text(
                  AppStrings.search,
                  style: _textTheme.titleLarge!.copyWith(
                    fontWeight: FontThickness.bold,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            SearchTextField(),
          ],
        ),
      ),
    );
  }
}
