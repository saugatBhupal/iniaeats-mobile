import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/card/cart_item_card.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftTitle(title: AppStrings.reviewCart, padding: 16),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final List<Cart> cartItems = context.watch<CartBloc>().cartItems;
              if (cartItems.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No items added to Cart.'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Slidable(
                    key: ValueKey(item.product.id),
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            context.read<CartBloc>().add(DeleteCartItem(cart: item));
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Remove',
                          autoClose: true,
                        ),
                      ],
                    ),
                    child: CartItemCard(
                      name: item.product.productName,
                      ingredients: item.product.tags.map((tag) => tag.name).toList(),
                      price: item.product.price,
                      portion: item.quantity,
                      onQuantityChanged: (newQuantity) {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(productId: item.product.id, quantity: newQuantity),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
