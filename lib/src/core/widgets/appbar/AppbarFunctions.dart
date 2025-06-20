import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/widgets/buttons/icon_button.dart';

class Appbarfunctions extends StatelessWidget {
  const Appbarfunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.logo, height: 32),
          Row(
            children: [
              CustomIconButton(icon: AppIcons.notification, count: 2),
              const SizedBox(width: 10),
              CustomIconButton(icon: AppIcons.cart, count: 10),
            ],
          ),
        ],
      ),
    );
  }
}
