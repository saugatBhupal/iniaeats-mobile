import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(AppStrings.noRoute)),
    );
  }
}
