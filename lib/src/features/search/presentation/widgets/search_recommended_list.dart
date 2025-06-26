import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/search/presentation/widgets/card/search_card.dart';

class SearchRecommendedList extends StatelessWidget {
  const SearchRecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.recommended,
            style: context.titleLarge.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
          child: SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => SearchCard(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 18);
              },
            ),
          ),
        ),
      ],
    );
  }
}
