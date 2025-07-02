import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/textspan/bullet_textspan.dart';

class TagsContainer extends StatelessWidget {
  final List<String> tags;
  const TagsContainer({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 14,
          runSpacing: 8,
          children: List.generate(tags.length, (index) => BulletTextspan(label: tags[index])),
        ),
      ),
    );
  }
}
