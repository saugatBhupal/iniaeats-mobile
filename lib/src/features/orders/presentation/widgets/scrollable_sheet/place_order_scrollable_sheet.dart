import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inaeats/src/config/screen_args.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/widgets/textspan/info_textspan.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/button/order_button.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/input/text_span_field.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/order_address_list.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/order_timing_grid.dart';

class PlaceOrderScrollableSheet extends StatelessWidget {
  final OrderScreenArgs orderScreenArgs;
  final String selectedAddress;
  final LatLng selectedLatLng;
  const PlaceOrderScrollableSheet({
    super.key,
    required this.orderScreenArgs,
    required this.selectedAddress,
    required this.selectedLatLng
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.45,
      minChildSize: 0.45,
      maxChildSize: 0.80,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
          decoration: BoxDecoration(
            color: AppColors.ceramic,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                offset: Offset(1, 1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 56,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    color: AppColors.black.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    InfoTextspan(
                      info: "Select the location you would like your order delivered.",
                      color: AppColors.ceramic,
                      margin: 10,
                    ),
                    OrderAddressList(currentAddress: selectedAddress),
                    OrderTimingGrid(),
                    TextspanField(),
                    SizedBox(height: 14),
                    OrderButton(
                      cartItems: orderScreenArgs.cartItems,
                      totalPayable: orderScreenArgs.totalPayable,
                      onPressed:
                          () => context.read<OrderBloc>().add(
                            PlaceOrder(
                              order: ProductOrder(
                                cart: orderScreenArgs.cartItems,
                                totalPrice: orderScreenArgs.totalPayable,
                                address: selectedAddress,
                                timing: context.read<OrderBloc>().deliveryTiming,
                                latLng: selectedLatLng
                              ),
                            ),
                          ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
