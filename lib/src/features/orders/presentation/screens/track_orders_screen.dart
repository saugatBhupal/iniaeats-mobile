import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/lat_long_utils.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/order_location_map.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/scrollable_sheet/track_order__scrollable_sheet.dart';

class TrackOrdersScreen extends StatelessWidget {
  final ProductOrder order;
  const TrackOrdersScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: AppStrings.trackOrder),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height / 2,
            child: OrderLocationMap(destination: order.latLng!),
          ),
          TrackOrderScrollableSheet(order: order),
        ],
      ),
    );
  }
}
