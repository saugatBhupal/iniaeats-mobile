import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/buttons/quantity_stepper_button.dart';
import 'package:inaeats/src/features/products/presentation/widgets/add_to_cart_button.dart';

class AddCartSection extends StatefulWidget {
  final int price;
  const AddCartSection({super.key, required this.price});

  @override
  State<AddCartSection> createState() => _AddCartSectionState();
}

class _AddCartSectionState extends State<AddCartSection> {
  int portion = 1;
  void _updatePortion(int value) {
    setState(() => portion = value);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
          children: [
            QuantityStepperButton(portion: portion, onChanged: _updatePortion),
            AddToCartButton(
              totalPrice: widget.price * portion,
              onPressed: () {
                // Handle cart logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
