import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/textspan/recipe_textspan.dart';

class RecipeSteps extends StatelessWidget {
  const RecipeSteps({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _steps = [
      "In a bowl, whisk together flour, sugar, baking powder, and salt.",
      "In a separate bowl, mix milk, egg, melted butter, and vanilla extract.",
      "Combine the wet and dry ingredients and stir until just mixed.",
      "Heat a non-stick pan over medium heat and lightly grease it.",
      "Pour 1/4 cup of batter onto the pan for each pancake.",
      "Cook until bubbles form on the surface, then flip and cook the other side until golden.",
      "Serve warm with your favorite toppings.",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          IconTitle(label: AppStrings.followTitle, fontSize: 14),
          SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 9,
            children: [
              ...List.generate(_steps.length, (index) {
                return RecipeTextspan(step: _steps[index], stepNumber: index + 1);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
