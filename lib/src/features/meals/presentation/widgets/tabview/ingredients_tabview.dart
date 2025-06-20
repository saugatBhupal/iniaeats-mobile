import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_ingredients.dart';

class IngredientsTabview extends StatelessWidget {
  final ScrollController? scrollController;
  const IngredientsTabview({Key? key, this.scrollController}) : super(key: key);

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
            child: InfoTextspan(info: AppStrings.storageInfo, margin: 0),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
