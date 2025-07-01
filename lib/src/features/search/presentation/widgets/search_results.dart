import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:inaeats/src/features/search/presentation/widgets/card/search_card.dart';

class SearchResults extends StatelessWidget {
  final String query;
  const SearchResults({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    searchBloc.add(SearchProduct(params: query));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final List<Product> searchProducts = searchBloc.searchProducts;
        if (searchProducts.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Text(
                'No products found for "$query"',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: searchProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 16.0 : 0.0),
                  child: SearchProductCard(product: searchProducts[index]),
                ),
            separatorBuilder: (context, index) => const SizedBox(height: 18),
          ),
        );
      },
    );
  }
}
