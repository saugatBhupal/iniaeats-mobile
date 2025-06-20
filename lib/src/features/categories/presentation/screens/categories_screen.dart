import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/categories_appbar.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _categories = [
      {'label': AppStrings.drinks, 'image': AppImages.drinks},
      {'label': AppStrings.readyEat, 'image': AppImages.readyEat},
      {'label': AppStrings.quickbites, 'image': AppImages.quickbites},
      {'label': AppStrings.gourmet, 'image': AppImages.gourmet},
      {'label': AppStrings.fruits, 'image': AppImages.fruits},
      {'label': AppStrings.vegan, 'image': AppImages.vegan},
      {'label': AppStrings.drinks, 'image': AppImages.drinks},
      {'label': AppStrings.chinese, 'image': AppImages.readyEat},
      {'label': AppStrings.quickbites, 'image': AppImages.quickbites},
      {'label': AppStrings.gourmet, 'image': AppImages.gourmet},
      {'label': AppStrings.fruits, 'image': AppImages.fruits},
      {'label': AppStrings.vegan, 'image': AppImages.vegan},
    ];

    return Scaffold(
      appBar: CategoriesAppbar(),
      body: GradientBackground(
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 18,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final item = _categories[index];
                return CategoryIcon(
                  label: item['label']!,
                  image: item['image']!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
