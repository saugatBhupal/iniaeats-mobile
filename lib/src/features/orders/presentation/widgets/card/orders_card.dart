import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/button/track_order_button.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/textspan/order_card_info_textspan.dart';

class OrdersCard extends StatelessWidget {
  final ProductOrder order;
  final bool isFirst;
  const OrdersCard({super.key, required this.order, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(18);
    final aspectRatio = 300 / 130;
    final cardHeight = context.height / 8;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.trackOrders, arguments: order),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = context.width;
          final height = width / aspectRatio;

          return Stack(
            children: [
              Positioned(
                top: 10,
                left: 12,
                right: 12,
                child: Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    color: AppColors.frog.withOpacity(0.55),
                    borderRadius: borderRadius,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(68, 199, 73, 0.4),
                        offset: Offset(1, 1),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(AppImages.orders, fit: BoxFit.cover),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 32.0),
                          child: OrderCardInfoTextspan(
                            productName: order.cart.first.product.productName,
                            address: order.address,
                            deliveryTiming: order.timing,
                          ),
                        ),
                        if (isFirst)
                          const Positioned(bottom: -2, right: 34, child: TrackOrderButton()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
