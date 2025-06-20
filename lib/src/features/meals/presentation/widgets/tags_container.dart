import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';

class TagsContainer extends StatelessWidget {
  const TagsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _tags = [
      "Italian",
      "Vegan",
      "Low-Sodium",
      "Sugar-free",
      "Gluten",
      "Vegatable Fat",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 14,
        runSpacing: 8,
        children: [
          ...List.generate(_tags.length, (index) {
            return BulletTextspan(label: _tags[index]);
          }),
        ],
      ),
    );
  }
}
