import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:inaeats/src/features/search/presentation/widgets/appbar/search_appbar.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_filter.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_item.dart';
import 'package:inaeats/src/features/search/presentation/widgets/search_results.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Scaffold(
      appBar: SearchAppbar(
        onSubmitted: (value) {
          if (value.trim().isNotEmpty) {
            searchBloc.add(SearchProduct(params: value));
          }
        },
      ),
      body: Column(
        children: [
          SearchFilter(),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              final currentQuery = (searchBloc.query.isNotEmpty) ? searchBloc.query : query;
              return SearchItem(query: currentQuery);
            },
          ),
          Expanded(child: SearchResults(query: query)),
        ],
      ),
    );
  }
}
