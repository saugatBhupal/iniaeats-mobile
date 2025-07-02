import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUsecase implements UsecaseWithoutParams<List<Cart>> {
  final CartRepository cartRepository;

  GetCartItemsUsecase({required this.cartRepository});
  @override
  Future<Either<Failure, List<Cart>>> call() {
    return cartRepository.fetchCartItems();
  }
}
