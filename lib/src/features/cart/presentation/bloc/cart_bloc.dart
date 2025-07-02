import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart_summary.dart';
import 'package:inaeats/src/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:inaeats/src/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:inaeats/src/features/cart/domain/usecases/remove_cart_item_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUsecase addToCartUsecase;
  final GetCartItemsUsecase getCartItemsUsecase;
  final RemoveCartItemUsecase removeCartItemUsecase;
  CartBloc({
    required this.addToCartUsecase,
    required this.getCartItemsUsecase,
    required this.removeCartItemUsecase,
  }) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is AddtoCart) {
        await _addtoCart(event, emit);
      }
      if (event is GetCartItems) {
        await _getCartItems(event, emit);
      }
      if (event is DeleteCartItem) {
        await _deleteCartItem(event, emit);
      }
      if (event is UpdateCartItemQuantity) {
        await _updateCartItemQuantity(event, emit);
      }
    });
  }

  Future<void> _addtoCart(AddtoCart event, Emitter<CartState> emit) async {
    emit(AddToCartLoading());
    try {
      final result = await addToCartUsecase.call(event.cart);
      result.fold(
        (failure) => emit(AddToCartFailed(message: failure.message)),
        (success) => emit(AddToCartSuccess(cart: success)),
      );
    } catch (e) {
      emit(AddToCartFailed(message: "Error: ${e.toString()}"));
    }
  }

  CartSummary _summary = CartSummary.initial();
  CartSummary get summary => _summary;
  final List<Cart> _cartItems = [];
  List<Cart> get cartItems => _cartItems;
  Future<void> _getCartItems(GetCartItems event, Emitter<CartState> emit) async {
    emit(GetCartItemsLoading());
    try {
      final result = await getCartItemsUsecase.call();
      result.fold((failure) => emit(GetCartItemsFailed(message: failure.message)), (success) {
        _cartItems
          ..clear()
          ..addAll(success);
        _summary = CartSummary.fromCartItems(_cartItems);

        emit(GetCartItemsSuccess(cartItems: success));
      });
    } catch (e) {
      emit(GetCartItemsFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _deleteCartItem(DeleteCartItem event, Emitter<CartState> emit) async {
    emit(DeleteCartItemLoading());
    try {
      final result = await removeCartItemUsecase.call(event.cart);
      result.fold((failure) => emit(DeleteCartItemFailed(message: failure.message)), (success) {
        final index = _cartItems.indexWhere((c) => c.product.id == event.cart.product.id);
        if (index != -1) {
          final existing = _cartItems[index];
          _cartItems.remove(existing);
          _summary = CartSummary.fromCartItems(_cartItems);
        }

        emit(DeleteCartItemSuccess());
      });
    } catch (e) {
      emit(DeleteCartItemFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _updateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    try {
      final index = _cartItems.indexWhere((item) => item.product.id == event.productId);
      if (index != -1) {
        final oldItem = _cartItems[index];
        _cartItems[index] = Cart(product: oldItem.product, quantity: event.quantity);
        _summary = CartSummary.fromCartItems(_cartItems);
      }
      emit(CartItemsUpdated(quantity: event.quantity));
    } catch (e) {
      emit(CartOperationFailed(message: e.toString()));
    }
  }
}
