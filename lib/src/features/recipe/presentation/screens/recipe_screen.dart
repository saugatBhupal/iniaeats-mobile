import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_ingredients.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_requirements.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_steps.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 12);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoTextspan(info: AppStrings.recipeInfo),
                _gap,
                RecipeRequirements(),
                _gap,
                InfoTextspan(info: AppStrings.packInfo),
                RecipeIngredients(),
                RecipeSteps(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
