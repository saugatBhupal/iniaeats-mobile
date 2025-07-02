import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> addToCart(Cart cart);
  Future<Either<Failure, List<Cart>>> fetchCartItems();
  Future<Either<Failure, void>> deleteCartItem(Cart cart);
}
