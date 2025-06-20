import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/appbar/AppbarFunctions.dart';

class OffersAppbar extends StatelessWidget implements PreferredSizeWidget {
  const OffersAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(105);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Appbarfunctions(),
    );
  }
}
