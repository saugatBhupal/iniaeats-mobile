import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_ingredients.dart';

class IngredientsTabview extends StatelessWidget {
  final ScrollController? scrollController;
  final int shelfLife;
  const IngredientsTabview({super.key, this.scrollController, required this.shelfLife});

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 12);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InfoTextspan(info: AppStrings.packInfo, margin: 0),
          ),
          _gap,
          RecipeIngredients(),
          _gap,
          Align(
            alignment: Alignment.centerLeft,
            child: InfoTextspan(
              info: "Best consumed within $shelfLife days of purchase.",
              margin: 0,
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
