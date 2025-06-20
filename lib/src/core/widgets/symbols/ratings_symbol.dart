import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';

class RatingsSymbol extends StatelessWidget {
  const RatingsSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.petal,
        border: Border.all(color: AppColors.peach),
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: SvgPicture.asset(AppIcons.rating),
            ),
            Text(
              "3.5",
              style: _textTheme.labelLarge!.copyWith(
                color: AppColors.salmon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
