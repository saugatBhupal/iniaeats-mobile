import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/repositories/cart_repository.dart';

class AddToCartUsecase implements UsecaseWithParams<Cart, Cart> {
  final CartRepository cartRepository;

  AddToCartUsecase({required this.cartRepository});
  @override
  Future<Either<Failure, Cart>> call(Cart params) {
    return cartRepository.addToCart(params);
  }
}
