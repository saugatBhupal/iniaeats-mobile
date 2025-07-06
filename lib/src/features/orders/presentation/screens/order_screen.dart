// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/config/screen_args.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/scrollable_sheet/place_order_scrollable_sheet.dart';

class OrderScreen extends StatelessWidget {
  final OrderScreenArgs orderScreenArgs;
  const OrderScreen({super.key, required this.orderScreenArgs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: "Place Order"),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is PlaceOrderFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is PlaceOrderSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.trackOrders, arguments: state.order);
          }
        },
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: context.height / 2,
              child: Image.asset(AppImages.map, fit: BoxFit.cover, alignment: Alignment.topCenter),
            ),
            PlaceOrderScrollableSheet(orderScreenArgs: orderScreenArgs),
          ],
        ),
      ),
    );
  }
}
