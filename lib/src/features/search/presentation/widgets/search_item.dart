import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/search/presentation/widgets/chip/search_chip.dart';

class SearchItem extends StatelessWidget {
  final String query;
  const SearchItem({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 18),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppColors.border)),
      ),
      child: Row(
        children: [
          Text(
            "Results For:",
            style: context.bodyLarge.copyWith(color: AppColors.black.withValues(alpha: 0.45)),
          ),
          SizedBox(width: 10),
          SearchChip(label: query, border: AppColors.frog, background: AppColors.white),
        ],
      ),
    );
  }
}
