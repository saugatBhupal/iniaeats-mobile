import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/left_title.dart';
import 'package:inaeats/src/features/cart/presentation/widgets/card/cart_item_card.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  final List<Map<String, dynamic>> cartItems = const [
    {
      "name": "Vegan Olio Spaghetti Kit",
      "ingredients": ["12gm Chicken", "500gm pasta"],
      "price": "560",
      "portion": 1,
    },
    {
      "name": "Grilled Chicken Salad",
      "ingredients": ["200gm chicken", "lettuce", "tomato"],
      "price": "430",
      "portion": 2,
    },
    {
      "name": "Fruit Smoothie",
      "ingredients": ["banana", "strawberries", "yogurt"],
      "price": "250",
      "portion": 1,
    },
    {
      "name": "Grilled Chicken Salad",
      "ingredients": ["200gm chicken", "lettuce", "tomato"],
      "price": "430",
      "portion": 2,
    },
    {
      "name": "Fruit Smoothie",
      "ingredients": ["banana", "strawberries", "yogurt"],
      "price": "250",
      "portion": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftTitle(title: AppStrings.reviewCart, padding: 16),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 14),
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemCard(
                name: item['name'],
                ingredients: List<String>.from(item['ingredients']),
                price: item['price'],
                portion: item['portion'],
              );
            },
          ),
        ],
      ),
    );
  }
}
