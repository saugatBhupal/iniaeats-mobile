import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class QuantityStepperButton extends StatelessWidget {
  final int portion;
  final ValueChanged<int> onChanged;
  const QuantityStepperButton({super.key, required this.portion, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: AppColors.latte, borderRadius: BorderRadius.circular(22)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => portion > 1 ? onChanged(portion - 1) : null,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.latte,
                border: Border.all(color: portion == 1 ? AppColors.grey : AppColors.green),
              ),
              child: Icon(
                Icons.remove,
                size: 22,
                color: portion == 1 ? AppColors.grey : AppColors.green,
              ),
            ),
          ),
          SizedBox(
            width: 32,
            child: Center(
              child: Text("$portion", style: context.titleLarge.copyWith(color: AppColors.green)),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(portion + 1),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.green),
              child: Icon(Icons.add, size: 20, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
