import 'package:flutter/material.dart';
import 'package:inaeats/src/features/search/presentation/widgets/card/search_card.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: EdgeInsets.only(top: index == 0 ? 16.0 : 0.0),
                child: SearchCard(),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 18),
        ),
      ),
    );
  }
}
