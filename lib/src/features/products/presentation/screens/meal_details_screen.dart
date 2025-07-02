import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/buttons/quantity_stepper_button.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/products/presentation/widgets/add_cart_section.dart';
import 'package:inaeats/src/features/products/presentation/widgets/add_to_cart_button.dart';
import 'package:inaeats/src/features/products/presentation/widgets/meal_details_image.dart';
import 'package:inaeats/src/features/products/presentation/widgets/meal_details_tabbar.dart';

class MealDetailsScreen extends StatefulWidget {
  final Product product;
  const MealDetailsScreen({super.key, required this.product});

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
                  return MealDetailsImage(scrollOffset: offset, product: widget.product);
                },
              ),
              Expanded(
                child: MealDetailsTabbar(
                  scrollController: _scrollController,
                  product: widget.product,
                ),
              ),
            ],
          ),
          AddCartSection(price: widget.product.price),
        ],
      ),
    );
  }
}
