part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddtoCart extends CartEvent {
  final Cart cart;

  const AddtoCart({required this.cart});
}

class GetCartItems extends CartEvent {
  const GetCartItems();
}

class DeleteCartItem extends CartEvent {
  final Cart cart;

  const DeleteCartItem({required this.cart});
}

class UpdateCartItemQuantity extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateCartItemQuantity({required this.productId, required this.quantity});
}
