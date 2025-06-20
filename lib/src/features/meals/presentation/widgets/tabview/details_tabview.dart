import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/allergens_container.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/nutrients_container.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/requirements_container.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/tags_container.dart';

class DetailsTabview extends StatelessWidget {
  final ScrollController? scrollController;
  const DetailsTabview({Key? key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        TagsContainer(),
        const CenterDivider(),
        NutrientsContainer(),
        const CenterDivider(),
        AllergensContainer(),
        const CenterDivider(),
        RequirementsContainer(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InfoTextspan(info: AppStrings.storageInfo),
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
