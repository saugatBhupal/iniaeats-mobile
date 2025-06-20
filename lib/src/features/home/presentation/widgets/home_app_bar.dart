import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/input/search_textfield.dart';
import 'package:inaeats/src/core/widgets/appbar/AppbarFunctions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(105);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Appbarfunctions(),
          const SizedBox(height: 14),
          SearchTextField(),
        ],
      ),
    );
  }
}
