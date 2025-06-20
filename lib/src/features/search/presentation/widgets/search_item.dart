import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/features/search/presentation/widgets/chip/search_chip.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 18),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppColors.border)),
      ),
      child: Row(
        children: [
          Text(
            "Results For:",
            style: _textTheme.bodyLarge!.copyWith(
              color: AppColors.black.withValues(alpha: 0.45),
            ),
          ),
          SizedBox(width: 10),
          SearchChip(
            label: "Spaghetti",
            border: AppColors.frog,
            background: AppColors.white,
          ),
        ],
      ),
    );
  }
}
