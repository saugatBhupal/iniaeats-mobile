import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/cart/data/datasources/local/cart_local_datasource.dart';
import 'package:inaeats/src/features/cart/data/datasources/local/cart_local_datasource_impl.dart';
import 'package:inaeats/src/features/cart/data/repositories/cart_remote_repository.dart';
import 'package:inaeats/src/features/cart/domain/repositories/cart_repository.dart';
import 'package:inaeats/src/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:inaeats/src/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:inaeats/src/features/cart/domain/usecases/remove_cart_item_usecase.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';

void initCart() {
  sl.registerLazySingleton<CartLocalDatasource>(() => CartLocalDatasourceImpl());
  sl.registerLazySingleton<CartRepository>(() => CartRemoteRepository(cartLocalDatasource: sl()));
  sl.registerLazySingleton<AddToCartUsecase>(() => AddToCartUsecase(cartRepository: sl()));
  sl.registerLazySingleton<GetCartItemsUsecase>(() => GetCartItemsUsecase(cartRepository: sl()));
  sl.registerLazySingleton<RemoveCartItemUsecase>(
    () => RemoveCartItemUsecase(cartRepository: sl()),
  );
  sl.registerFactory<CartBloc>(
    () => CartBloc(addToCartUsecase: sl(), getCartItemsUsecase: sl(), removeCartItemUsecase: sl()),
  );
}
