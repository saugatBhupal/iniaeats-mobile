part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class GetRecommendedProductsLoading extends SearchState {
  const GetRecommendedProductsLoading();
}

class GetRecommendedProductsSuccess extends SearchState {
  final List<Product> products;

  const GetRecommendedProductsSuccess({required this.products});
}

class GetRecommendedProductsError extends SearchState {
  final String message;

  const GetRecommendedProductsError({required this.message});
}

class SearchProductLoading extends SearchState {
  const SearchProductLoading();
}

class SearchProductSuccess extends SearchState {
  final List<Product> products;

  const SearchProductSuccess({required this.products});
}

class SearchProductError extends SearchState {
  final String message;

  const SearchProductError({required this.message});
}
