import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_extensions.dart';

class FoodMarkSymbol extends StatelessWidget {
  final FoodMark foodMark;
  final double? padding;
  final double? circleSize;
  const FoodMarkSymbol({
    super.key,
    required this.foodMark,
    this.padding,
    this.circleSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: foodMark.getBackgroundColor(),
        border: Border.all(color: foodMark.getPrimaryColor()),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 4.5),
        child: Container(
          height: circleSize ?? 6,
          width: circleSize ?? 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: foodMark.getPrimaryColor(),
          ),
        ),
      ),
    );
  }
}
