import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_details.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height / 1.2,
            child: Image.asset(
              AppGifs.onboarding,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            top: context.statusBarSize > 60 ? 58 : context.statusBarSize,
            left: 16,
            child: AppbarBackButton(),
          ),
          RecipeDetails(),
        ],
      ),
    );
  }
}
