part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final Cart cart;

  const AddToCartSuccess({required this.cart});
}

class AddToCartFailed extends CartState {
  final String message;

  const AddToCartFailed({required this.message});
}

class GetCartItemsLoading extends CartState {}

class GetCartItemsSuccess extends CartState {
  final List<Cart> cartItems;

  const GetCartItemsSuccess({required this.cartItems});
}

class GetCartItemsFailed extends CartState {
  final String message;

  const GetCartItemsFailed({required this.message});
}

class DeleteCartItemLoading extends CartState {}

class DeleteCartItemSuccess extends CartState {
  const DeleteCartItemSuccess();
}

class DeleteCartItemFailed extends CartState {
  final String message;

  const DeleteCartItemFailed({required this.message});
}

class CartItemsUpdated extends CartState {
  final CartSummary summary;
  const CartItemsUpdated({required this.summary});
  @override
  List<Object> get props => [summary];
}

class CartOperationFailed extends CartState {
  final String message;

  const CartOperationFailed({required this.message});
}
