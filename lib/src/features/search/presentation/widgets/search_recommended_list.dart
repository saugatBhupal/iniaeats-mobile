import 'package:flutter/material.dart';
import 'package:inaeats/src/features/search/presentation/widgets/card/search_card.dart';

class SearchRecommendedList extends StatelessWidget {
  const SearchRecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => SearchCard(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 18);
              },
            ),
          ),
        ),
      ],
    );
  }
}
