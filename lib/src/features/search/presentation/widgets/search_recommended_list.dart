import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:inaeats/src/features/search/presentation/widgets/card/search_card.dart';

class SearchRecommendedList extends StatelessWidget {
  const SearchRecommendedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.recommended,
            style: context.titleLarge.copyWith(
              color: AppColors.green,
              fontWeight: FontThickness.bold,
            ),
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final List<Product> recommendedProducts =
                context.watch<SearchBloc>().recommendedProducts;
            if (recommendedProducts.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No recommended products found.'),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendedProducts.length,
                itemBuilder:
                    (context, index) => SearchProductCard(product: recommendedProducts[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 18),
              ),
            );
          },
        ),
      ],
    );
  }
}
