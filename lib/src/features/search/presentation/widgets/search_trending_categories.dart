import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/categories/presentation/widgets/category_icon.dart';

class SearchTrendingCategories extends StatelessWidget {
  const SearchTrendingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _categories = [
      {'label': AppStrings.drinks, 'image': AppImages.drinks},
      {'label': AppStrings.readyEat, 'image': AppImages.readyEat},
      {'label': AppStrings.quickbites, 'image': AppImages.quickbites},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${AppStrings.trending} ${AppStrings.categories}",
            style: context.titleLarge.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.bold,
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
                return CategoryIcon(label: item['label']!, image: item['image']!);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          ),
        ],
      ),
    );
  }
}
