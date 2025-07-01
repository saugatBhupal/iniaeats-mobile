part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetRecommendedProducts extends SearchEvent {
  const GetRecommendedProducts();
}

class SearchProduct extends SearchEvent {
  final String params;

  const SearchProduct({required this.params});
}
