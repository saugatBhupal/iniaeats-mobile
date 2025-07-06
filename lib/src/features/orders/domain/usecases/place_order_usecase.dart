import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/domain/repositories/order_repository.dart';

class PlaceOrderUsecase implements UsecaseWithParams<ProductOrder, ProductOrder> {
  final OrderRepository orderRepository;

  PlaceOrderUsecase({required this.orderRepository});
  @override
  Future<Either<Failure, ProductOrder>> call(ProductOrder params) {
    return orderRepository.placeOrder(params);
  }
}
