import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';

abstract class OrderRepository {
  Future<Either<Failure, ProductOrder>> placeOrder(ProductOrder order);
  Future<Either<Failure, List<ProductOrder>>> getAllOrder();
}
