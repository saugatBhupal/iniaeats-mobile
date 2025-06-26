import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/categories/domain/entities/product_catergory.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class SearchTrendingCategories extends StatelessWidget {
  const SearchTrendingCategories({super.key});

  static const List<ProductCategory> _categories = [
    ProductCategory(label: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory(label: AppStrings.readyEat, image: AppImages.readyEat),
    ProductCategory(label: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory(label: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory(label: AppStrings.fruits, image: AppImages.fruits),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "${AppStrings.trending} ${AppStrings.categories}",
              style: context.titleLarge!.copyWith(
                color: AppColors.green,
                fontWeight: FontThickness.bold,
              ),
            ),
          ),

          SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 100),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final item = _categories[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CategoryIcon(label: item.label, image: item.image),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ],
      ),
    );
  }
}
