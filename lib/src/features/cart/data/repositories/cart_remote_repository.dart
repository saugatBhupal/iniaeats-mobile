import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/data/datasources/local/cart_local_datasource.dart';
import 'package:inaeats/src/features/cart/data/models/cart_hive_model.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/repositories/cart_repository.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

class CartRemoteRepository implements CartRepository {
  final CartLocalDatasource cartLocalDatasource;

  CartRemoteRepository({required this.cartLocalDatasource});
  @override
  Future<Either<Failure, Cart>> addToCart(Cart cart) async {
    try {
      final cartHiveModel = CartHiveModel(productId: cart.product.id, quantity: cart.quantity);
      cartLocalDatasource.addCartItem(cartHiveModel);
      return Right(cart);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> fetchCartItems() async {
    try {
      final List<CartHiveModel> cartHiveModel = await cartLocalDatasource.getCartItems();
      final String jsonString = await rootBundle.loadString('assets/data/product.data');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      final List<Product> allProducts = jsonList.map((e) => Product.fromJson(e)).toList();
      final List<Cart> cartProducts =
          cartHiveModel.map((cartItem) {
            final product = allProducts.firstWhere((p) => p.id == cartItem.productId);
            return Cart(product: product, quantity: cartItem.quantity);
          }).toList();
      return Right(cartProducts);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCartItem(Cart cart) async {
    try {
      final cartHiveModel = CartHiveModel(productId: cart.product.id, quantity: cart.quantity);
      cartLocalDatasource.removeCartItem(cartHiveModel);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
