import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List<Map<String, String>> _categories = [
      {'label': AppStrings.drinks, 'image': AppImages.drinks},
      {'label': AppStrings.readyEat, 'image': AppImages.readyEat},
      {'label': AppStrings.quickbites, 'image': AppImages.quickbites},
      {'label': AppStrings.gourmet, 'image': AppImages.gourmet},
      {'label': AppStrings.fruits, 'image': AppImages.fruits},
      {'label': AppStrings.vegan, 'image': AppImages.vegan},
    ];

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
                  style: _textTheme.titleLarge!.copyWith(
               color: AppColors.black.withValues(alpha: 0.6),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    AppStrings.see,
                    style: _textTheme.bodyLarge!.copyWith(
                      color: AppColors.frog,
                    ),
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
                  child: CategoryIcon(
                    label: item['label']!,
                    image: item['image']!,
                  ),
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
