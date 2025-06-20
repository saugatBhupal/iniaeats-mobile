import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/home/presentation/widgets/card/meal_tab_card.dart';

class MealTabView extends StatelessWidget {
  final String mealTimel;
  const MealTabView({Key? key, required this.mealTimel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.28,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? 16 : 0.0),
              child: MealTabCard(mealTimel: mealTimel),
            ),
        separatorBuilder: (context, index) {
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
