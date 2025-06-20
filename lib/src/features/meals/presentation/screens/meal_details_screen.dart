import 'package:flutter/material.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/meal_details_image.dart';
import 'package:inaeats/src/features/meals/presentation/widgets/meal_details_tabbar.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MealDetailsImage(scrollOffset: _scrollOffset),
          Expanded(
            child: MealDetailsTabbar(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}
