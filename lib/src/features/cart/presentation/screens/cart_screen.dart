import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/config/screen_args.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/widgets/alerts/custom_alert_dialog.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/core/widgets/snackbar/app_snackbar_alert.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/button/order_button.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/cart_coupons.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/cart_images.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/cart_items.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/cart_order_receit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartBloc>();
    final List<Cart> cartItems = cartBloc.cartItems;
    final int totalPayable = cartBloc.summary.totalPayable;
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CouponAppliedSuccess) {
          showCustomAlertOverlay(context, type: AlertType.coupon, title: state.coupon?.code);
        }
        if (state is DeleteCartItemSuccess) {
          showCustomAlertOverlay(
            context,
            type: AlertType.removeitem,
            subtitle: state.cart.product.productName,
          );
        }
      },
      child: Scaffold(
        appBar: TitleAppBar(title: AppStrings.cartAppbar),
        body: GradientBackground(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [CartImages(), CartCoupons(), CartItems(), CartOrderReceit()],
                ),
              ),
              Positioned(
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
                  padding: const EdgeInsets.fromLTRB(20, 6, 20, 16),
                  child: OrderButton(
                    cartItems: cartItems,
                    totalPayable: totalPayable,
                    onPressed: () {
                      if (cartItems.isNotEmpty) {
                        Navigator.of(context).pushNamed(
                          AppRoutes.orders,
                          arguments: OrderScreenArgs(
                            cartItems: cartItems,
                            totalPayable: totalPayable,
                          ),
                        );
                      } else {
                        buildToast(toastType: ToastType.error, msg: "Add Items to Cart");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
