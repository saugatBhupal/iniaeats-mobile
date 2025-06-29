import 'package:flutter/material.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/listview/track_order_chip.dart';

class TrackOrderStatusList extends StatelessWidget {
  const TrackOrderStatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(padding: const EdgeInsets.only(left: 12.0), child: TrackOrderChip());
        },
      ),
    );
  }
}
