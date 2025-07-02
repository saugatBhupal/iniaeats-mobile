import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/repositories/cart_repository.dart';

class RemoveCartItemUsecase implements UsecaseWithParams<void, Cart> {
  final CartRepository cartRepository;

  RemoveCartItemUsecase({required this.cartRepository});
  @override
  Future<Either<Failure, void>> call(Cart params) {
    return cartRepository.deleteCartItem(params);
  }
}
