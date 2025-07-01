import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/search/domain/usecases/get_recommended_products_usecase.dart';
import 'package:inaeats/src/features/search/domain/usecases/search_product_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetRecommendedProductsUsecase getRecommendedProductsUsecase;
  final SearchProductUsecase searchProductUsecase;
  SearchBloc({required this.getRecommendedProductsUsecase, required this.searchProductUsecase})
    : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is GetRecommendedProducts) {
        await _getRecommendedProducts(event, emit);
      }
      if (event is SearchProduct) {
        await _searchProduct(event, emit);
      }
    });
  }

  final List<Product> _recommendedProducts = [];
  List<Product> get recommendedProducts => _recommendedProducts;
  Future<void> _getRecommendedProducts(
    GetRecommendedProducts event,
    Emitter<SearchState> emit,
  ) async {
    emit(const GetRecommendedProductsLoading());
    try {
      final result = await getRecommendedProductsUsecase.call();
      result.fold((failure) => emit(GetRecommendedProductsError(message: failure.message)), (
        success,
      ) {
        _recommendedProducts
          ..clear()
          ..addAll(success);
        emit(GetRecommendedProductsSuccess(products: success));
      });
    } catch (e) {
      emit(GetRecommendedProductsError(message: "Error: ${e.toString()}"));
    }
  }

  String _query = "";
  String get query => _query;
  final List<Product> _searchProducts = [];
  List<Product> get searchProducts => _searchProducts;
  Future<void> _searchProduct(SearchProduct event, Emitter<SearchState> emit) async {
    emit(const SearchProductLoading());
    try {
      final result = await searchProductUsecase.call(event.params);
      result.fold((failure) => emit(SearchProductError(message: failure.message)), (success) {
        _query = event.params;
        _searchProducts
          ..clear()
          ..addAll(success);
        emit(SearchProductSuccess(products: success));
      });
    } catch (e) {
      emit(SearchProductError(message: "Error: ${e.toString()}"));
    }
  }
}
