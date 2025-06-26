import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_categories.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_app_bar.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_customer_service.dart';
import 'package:inaeats/src/features/home/presentation/widgets/home_spotlights.dart';
import 'package:inaeats/src/features/home/presentation/widgets/promos_slider.dart';
import 'package:inaeats/src/features/home/presentation/widgets/meal_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: GradientBackground(
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
      ),
    );
  }
}
