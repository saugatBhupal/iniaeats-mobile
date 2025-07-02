import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/widgets/buttons/quantity_stepper_button.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/products/presentation/widgets/add_to_cart_button.dart';

class AddCartSection extends StatefulWidget {
  final Product product;
  const AddCartSection({super.key, required this.product});

  @override
  State<AddCartSection> createState() => _AddCartSectionState();
}

class _AddCartSectionState extends State<AddCartSection> {
  final ValueNotifier<int> portionNotifier = ValueNotifier(1);

  @override
  void dispose() {
    portionNotifier.dispose();
    super.dispose();
  }

  void _updatePortion(int value) {
    portionNotifier.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is AddToCartFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is AddToCartSuccess) {
          buildToast(toastType: ToastType.success, msg: "Item Added to Cart");
          Navigator.of(context).pushNamed(AppRoutes.cart);
        }
      },
      child: Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFAFFF8),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.16),
                offset: const Offset(1, 1),
                blurRadius: 20,
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(30, 6, 30, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: portionNotifier,
                builder: (context, portion, _) {
                  return QuantityStepperButton(initialPortion: portion, onChanged: _updatePortion);
                },
              ),

              ValueListenableBuilder<int>(
                valueListenable: portionNotifier,
                builder: (context, portion, _) {
                  return AddToCartButton(
                    totalPrice: widget.product.price * portion,
                    onPressed: () {
                      context.read<CartBloc>().add(
                        AddtoCart(cart: Cart(product: widget.product, quantity: portion)),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
