import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_categories.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_customer_service.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_spotlights.dart';
import 'package:inaeats/src/features/home/presentation/widgets/meal_tabs.dart';
import 'package:inaeats/src/features/home/presentation/widgets/promos_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PromoSlider(),
            MealTabs(),
            HomeCategories(),
            HomeSpotlights(),
            HomeCustomerService(),
          ],
        ),
      ),
    );
  }
}
