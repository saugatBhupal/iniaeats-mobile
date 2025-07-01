import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/search/domain/usecases/get_recommended_products_usecase.dart';
import 'package:inaeats/src/features/search/domain/usecases/search_product_usecase.dart';
import 'package:inaeats/src/features/search/presentation/bloc/search_bloc.dart';

void initSearch() {
  sl.registerLazySingleton<GetRecommendedProductsUsecase>(() => GetRecommendedProductsUsecase());
  sl.registerLazySingleton<SearchProductUsecase>(() => SearchProductUsecase());
  sl.registerFactory<SearchBloc>(
    () => SearchBloc(getRecommendedProductsUsecase: sl(), searchProductUsecase: sl()),
  );
}
