import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/data/datasources/local/cart_local_datasource.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/orders/data/datasources/local/order_local_repository.dart';
import 'package:inaeats/src/features/orders/data/models/product_order_hive_model.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/domain/repositories/order_repository.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class OrderRemoteRepository implements OrderRepository {
  final OrderLocalRepository orderLocalRepository;
  final CartLocalDatasource cartLocalDatasource;
  OrderRemoteRepository({required this.orderLocalRepository, required this.cartLocalDatasource});
  @override
  Future<Either<Failure, ProductOrder>> placeOrder(ProductOrder order) async {
    try {
      final cartModels =
          order.cart.map((cartItem) {
            return CartHiveModel(productId: cartItem.product.id, quantity: cartItem.quantity);
          }).toList();
      final orderHiveModel = ProductOrderHiveModel(
        cart: cartModels,
        totalPrice: order.totalPrice,
        address: order.address,
        timing: order.timing.name,
      );
      orderLocalRepository.addOrder(orderHiveModel);
      cartLocalDatasource.removeCartItems();
      return Right(order);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductOrder>>> getAllOrder() async {
    try {
      final ordersHive = await orderLocalRepository.getAllOrders();
      final String jsonString = await rootBundle.loadString('assets/data/product.data');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();
      print("orders");
      List<ProductOrder> orders =
          ordersHive.map((orderHive) {
            final List<Cart> cart =
                orderHive.cart.map((cartHive) {
                  final product = allProducts.firstWhere((p) => p.id == cartHive.productId);
                  return Cart(product: product, quantity: cartHive.quantity);
                }).toList();

            final timing = DeliveryTiming.values.firstWhere(
              (e) => e.name == orderHive.timing,
              orElse: () => DeliveryTiming.immediately,
            );
            return ProductOrder(
              cart: cart,
              totalPrice: orderHive.totalPrice,
              address: orderHive.address,
              timing: timing,
            );
          }).toList();

      return Right(orders);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
