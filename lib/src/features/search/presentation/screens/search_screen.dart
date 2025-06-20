import 'package:flutter/material.dart';
import 'package:inaeats/src/features/search/presentation/widgets/appbar/search_appbar.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_history.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_recommended_list.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_trending_categories.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHistory(),
            SearchTrendingCategories(),
            SearchRecommendedList(),
          ],
        ),
      ),
    );
  }
}
