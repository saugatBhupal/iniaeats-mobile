import 'package:flutter/material.dart';
import 'package:inaeats/src/features/search/presentation/widgets/appbar/search_appbar.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_filter.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_item.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_results.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppbar(),
      body: Column(
        children: [
          SearchFilter(),
          SearchItem(),
          Expanded(child: SearchResults()),
        ],
      ),
    );
  }
}
