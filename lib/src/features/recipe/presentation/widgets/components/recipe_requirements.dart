import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';

class RecipeRequirements extends StatelessWidget {
  const RecipeRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _requirements = [
      "Boiling Pot",
      "Frying Pan",
      "Running Water",
      "Cooking Spoons",
      "Chopping Board",
      "Knives",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTitle(label: AppStrings.requirements, fontSize: 14),
        const SizedBox(height: 12),
        Wrap(
          spacing: 20,
          runSpacing: 9,
          children:
              _requirements.map((requirement) {
                return BulletTextspan(label: requirement);
              }).toList(),
        ),
      ],
    );
  }
}
