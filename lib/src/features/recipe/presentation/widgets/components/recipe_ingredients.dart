import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/textspan/ingredients_textspan.dart';

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = [
      "26g of unsalted butter",
      "3g tomato paste",
      "150g dried spaghetti",
      "60g chopped onions",
      "40g diced bell peppers",
      "5g minced garlic",
      "100g crushed tomatoes",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconTitle(label: AppStrings.boxTitle, fontSize: 14),
          SizedBox(height: 10),
          Wrap(
            spacing: 20,
            runSpacing: 9,
            children:
                ingredients.map((ingredient) {
                  return IngredientsTextspan(ingredient: ingredient);
                }).toList(),
          ),
        ],
      ),
    );
  }
}
