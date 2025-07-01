import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/categories/domain/entities/product_catergory.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  final List<ProductCategory> _categories = [
    ProductCategory.initial().copyWith(name: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory.initial().copyWith(name: AppStrings.readyEat, image: AppImages.readyEat),
    ProductCategory.initial().copyWith(name: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory.initial().copyWith(name: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory.initial().copyWith(name: AppStrings.fruits, image: AppImages.fruits),
    ProductCategory.initial().copyWith(name: AppStrings.vegan, image: AppImages.vegan),
    ProductCategory.initial().copyWith(name: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory.initial().copyWith(name: AppStrings.chinese, image: AppImages.readyEat),
    ProductCategory.initial().copyWith(name: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory.initial().copyWith(name: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory.initial().copyWith(name: AppStrings.fruits, image: AppImages.fruits),
    ProductCategory.initial().copyWith(name: AppStrings.vegan, image: AppImages.vegan),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: AppStrings.moreCat),
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
                final category = _categories[index];
                return CategoryIcon(label: category.name, image: category.image);
              },
            ),
          ),
        ),
      ),
    );
  }
}
