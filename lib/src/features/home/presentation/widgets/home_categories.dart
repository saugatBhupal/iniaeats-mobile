import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/categories/domain/entities/product_catergory.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  static const List<ProductCategory> _categories = [
    ProductCategory(label: AppStrings.drinks, image: AppImages.drinks),
    ProductCategory(label: AppStrings.readyEat, image: AppImages.readyEat),
    ProductCategory(label: AppStrings.quickbites, image: AppImages.quickbites),
    ProductCategory(label: AppStrings.gourmet, image: AppImages.gourmet),
    ProductCategory(label: AppStrings.fruits, image: AppImages.fruits),
    ProductCategory(label: AppStrings.vegan, image: AppImages.vegan),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.categories,
                  style: context.titleLarge.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
                ),
                TextButton(
                  onPressed: () {
                    // Your onTap logic here
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    AppStrings.see,
                    style: context.bodyLarge.copyWith(color: AppColors.frog),
                  ),
                ),
              ],
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
