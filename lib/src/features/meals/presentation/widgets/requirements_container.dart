import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/tags_container.dart';

class RequirementsContainer extends StatelessWidget {
  const RequirementsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
          child: IconTitle(label: AppStrings.requirements, fontSize: 14),
        ),
        TagsContainer(),
      ],
    );
  }
}
