import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class FiltersChip extends StatefulWidget {
  final List<String> filterList;
  const FiltersChip({super.key, required this.filterList});

  @override
  State<FiltersChip> createState() => _FiltersChipState();
}

class _FiltersChipState extends State<FiltersChip> {
  List<String> selectedFilter = [];

  List<Widget> _buildFilterList() {
    return widget.filterList.map((item) {
      bool isSelected = selectedFilter.contains(item);

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected ? selectedFilter.remove(item) : selectedFilter.add(item);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.green : AppColors.doctor,
              border: Border.all(color: AppColors.genie),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              item,
              style: context.bodySmall.copyWith(
                color: isSelected ? AppColors.white : AppColors.black.withValues(alpha: 0.45),
                fontWeight: FontThickness.semiBold,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: _buildFilterList());
  }
}
