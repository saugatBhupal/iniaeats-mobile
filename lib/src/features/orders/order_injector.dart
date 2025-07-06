import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/orders/data/datasources/local/order_local_repository.dart';
import 'package:inaeats/src/features/orders/data/datasources/local/order_local_repository_impl.dart';
import 'package:inaeats/src/features/orders/data/repositories/order_remote_repository.dart';
import 'package:inaeats/src/features/orders/domain/repositories/get_all_orders_usecase.dart';
import 'package:inaeats/src/features/orders/domain/repositories/order_repository.dart';
import 'package:inaeats/src/features/orders/domain/usecases/place_order_usecase.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';

void initOrders() {
  sl.registerLazySingleton<OrderLocalRepository>(() => OrderLocalRepositoryImpl());
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRemoteRepository(orderLocalRepository: sl(), cartLocalDatasource: sl()),
  );
  sl.registerLazySingleton<PlaceOrderUsecase>(() => PlaceOrderUsecase(orderRepository: sl()));
  sl.registerLazySingleton<GetAllOrdersUsecase>(() => GetAllOrdersUsecase(orderRepository: sl()));
  sl.registerFactory<OrderBloc>(
    () => OrderBloc(placeOrderUsecase: sl(), getAllOrdersUsecase: sl()),
  );
}
