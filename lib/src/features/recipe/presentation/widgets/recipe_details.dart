import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_ingredients.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_requirements.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_steps.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({super.key});
  final _gap = const SizedBox(height: 12);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.88,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -2))],
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 56,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  children: [
                    InfoTextspan(info: AppStrings.recipeInfo),
                    _gap,
                    const RecipeRequirements(),
                    _gap,
                    InfoTextspan(info: AppStrings.packInfo),
                    _gap,
                    const RecipeIngredients(),
                    _gap,
                    const RecipeSteps(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
