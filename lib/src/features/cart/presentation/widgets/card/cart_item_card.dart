import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/quantity_stepper_button.dart';
import 'package:inaeats/src/core/widgets/images/placeholder_image.dart';

class CartItemCard extends StatelessWidget {
  final String name;
  final List<String> ingredients;
  final int price;
  final int portion;
  final ValueChanged<int> onQuantityChanged;
  const CartItemCard({
    super.key,
    required this.name,
    required this.ingredients,
    required this.price,
    required this.portion,
    required this.onQuantityChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlaceholderImage(
          title: "Title",
          isSquare: true,
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdXMdi0TIl56hRxT1HK6SpR9nkZweSajL_Ag&s",
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.bodyLarge.copyWith(color: AppColors.green),
              ),
              Text(
                ingredients.join(', '),
                style: context.bodyLarge.copyWith(
                  color: AppColors.black.withValues(alpha: 0.45),
                  fontWeight: FontThickness.regular,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${AppStrings.rupee} $price",
                style: context.bodyLarge.copyWith(color: AppColors.frog),
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        QuantityStepperButton(
          initialPortion: portion,
          onChanged: (int updatedValue) {
            onQuantityChanged(updatedValue);
          },
        ),
      ],
    );
  }
}
