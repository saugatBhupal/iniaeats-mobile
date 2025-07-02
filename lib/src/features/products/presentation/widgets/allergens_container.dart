import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/products/domain/entities/allergen.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tags_container.dart';

class AllergensContainer extends StatelessWidget {
  final List<Allergen> allergens;
  const AllergensContainer({super.key, required this.allergens});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 10.0),
                child: IconTitle(label: AppStrings.allergens, fontSize: 14),
              ),

              Text(
                "(Ingredients can be removed in order page)",
                style: context.labelLarge.copyWith(color: AppColors.black.withValues(alpha: 0.45)),
              ),
            ],
          ),
        ),
        TagsContainer(tags: allergens.map((allergen) => allergen.name).toList()),
      ],
    );
  }
}
