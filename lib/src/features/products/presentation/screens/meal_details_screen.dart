import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/buttons/quantity_stepper_button.dart';
import 'package:inaeats/src/features/products/presentation/widgets/add_to_cart_button.dart';
import 'package:inaeats/src/features/products/presentation/widgets/meal_details_image.dart';
import 'package:inaeats/src/features/products/presentation/widgets/meal_details_tabbar.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> offsetNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      offsetNotifier.value = offset;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    offsetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: offsetNotifier,
                builder: (context, offset, child) {
                  return MealDetailsImage(scrollOffset: offset);
                },
              ),
              Expanded(child: MealDetailsTabbar(scrollController: _scrollController)),
            ],
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
              padding: const EdgeInsets.fromLTRB(30, 6, 30, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [QuantityStepperButton(initialPortion: 1), AddToCartButton()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
