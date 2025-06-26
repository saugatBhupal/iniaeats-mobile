import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/categories/domain/entities/product_catergory.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/categories_appbar.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const List<ProductCategory> _categories = [
    ProductCategory(label: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory(label: AppStrings.readyEat, image: AppImages.readyEat),
    ProductCategory(label: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory(label: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory(label: AppStrings.fruits, image: AppImages.fruits),
    ProductCategory(label: AppStrings.vegan, image: AppImages.vegan),
    ProductCategory(label: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory(label: AppStrings.chinese, image: AppImages.readyEat),
    ProductCategory(label: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory(label: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory(label: AppStrings.fruits, image: AppImages.fruits),
    ProductCategory(label: AppStrings.vegan, image: AppImages.vegan),
  ];

  @override
  Widget build(BuildContext context) {
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
                return CategoryIcon(label: item.label, image: item.image);
              },
            ),
          ),
        ),
      ),
    );
  }
}
