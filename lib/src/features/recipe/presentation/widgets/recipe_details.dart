import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_ingredients.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_requirements.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_steps.dart';

class RecipeDetails extends StatelessWidget {
  RecipeDetails({super.key});
  final _gap = SizedBox(height: 12);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.20,
      minChildSize: 0.20,
      maxChildSize: 0.88,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 24, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -2))],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 56,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                InfoTextspan(info: AppStrings.recipeInfo),
                _gap,
                RecipeRequirements(),
                _gap,
                InfoTextspan(info: AppStrings.packInfo),
                _gap,
                RecipeIngredients(),
                _gap,
                RecipeSteps(),
              ],
            ),
          ),
        );
      },
    );
  }
}
