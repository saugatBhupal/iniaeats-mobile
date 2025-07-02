import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/products/presentation/widgets/allergens_container.dart';
import 'package:inaeats/src/features/products/presentation/widgets/nutrients_container.dart';
import 'package:inaeats/src/features/products/presentation/widgets/requirements_container.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tags_container.dart';

class DetailsTabview extends StatelessWidget {
  final ScrollController? scrollController;
  final Product product;
  const DetailsTabview({super.key, this.scrollController, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        TagsContainer(tags: product.tags.map((tag) => tag.name).toList()),
        const CenterDivider(),
        NutrientsContainer(
          protein: product.protein,
          weight: product.weight,
          fats: product.fats,
          carbs: product.carbs,
        ),
        const CenterDivider(),
        AllergensContainer(allergens: product.allergens),
        const CenterDivider(),
        RequirementsContainer(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InfoTextspan(
              info: "Best consumed within ${product.shelfLife} days of purchase.",
            ),
          ),
        ),

        const SizedBox(height: 120),
      ],
    );
  }
}

class CenterDivider extends StatelessWidget {
  const CenterDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Divider(
        color: AppColors.turtle,
        indent: context.width / 4,
        endIndent: context.width / 4,
      ),
    );
  }
}
