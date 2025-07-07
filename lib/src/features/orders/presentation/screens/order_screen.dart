import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/config/screen_args.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/core/widgets/snackbar/app_snackbar_alert.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/choose_location_map.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/scrollable_sheet/place_order_scrollable_sheet.dart';

class OrderScreen extends StatefulWidget {
  final OrderScreenArgs orderScreenArgs;
  const OrderScreen({super.key, required this.orderScreenArgs});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedAddress = "Naxal Bhagwati Temple Kathmandu काठमाडौँ, Nepal";
  LatLng selectedLatLng = LatLng(27.71291186491344, 85.3288614539381);

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
            showCustomAlertOverlay(context, type: AlertType.order);
            Navigator.of(context).pushNamed(AppRoutes.home);
          }
        },
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: context.height / 2,
              child: ChooseLocationMap(
                onLocationSelected: (address, latLng) {
                  setState(() {
                    selectedAddress = address;
                    selectedLatLng = latLng;
                  });
                },
              ),
            ),
            PlaceOrderScrollableSheet(
              orderScreenArgs: widget.orderScreenArgs,
              selectedAddress: selectedAddress,
              selectedLatLng: selectedLatLng,
            ),
          ],
        ),
      ),
    );
  }
}
