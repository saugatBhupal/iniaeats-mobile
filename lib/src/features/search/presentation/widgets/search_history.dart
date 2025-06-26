import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/search/presentation/widgets/chip/search_chip.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({super.key});

  static const List<String> _history = [
    "Spaghetti",
    "Outdoor Kits",
    "Soup",
    "Cookies",
    "Fresh Mango",
    "Bakery",
    "Chocochip cake",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.history,
            style: context.titleLarge.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              ...List.generate(_history.length, (index) {
                return SearchChip(label: _history[index]);
              }),
            ],
          ),
        ],
      ),
    );
  }
}
