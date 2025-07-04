import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/scrollable_sheet/track_order__scrollable_sheet.dart';

class TrackOrdersScreen extends StatelessWidget {
  const TrackOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: AppStrings.trackOrder),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height / 2,
            child: Image.asset(AppImages.map, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
          TrackOrderScrollableSheet(),
        ],
      ),
    );
  }
}
