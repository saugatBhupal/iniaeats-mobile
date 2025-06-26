import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/tabbar/app_tabbar.dart';
import 'package:inaeats/src/features/home/presentation/widgets/tab_view/meal_tab_view.dart';

class MealTabs extends StatefulWidget {
  const MealTabs({super.key});

  @override
  State<MealTabs> createState() => _MealTabsState();
}

class _MealTabsState extends State<MealTabs> with TickerProviderStateMixin {
  late final TabController _tabController;

  static const List<String> _mealOptions = [
    AppStrings.breakfast,
    AppStrings.lunch,
    AppStrings.dinner,
    AppStrings.snack,
    AppStrings.workout,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _mealOptions.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _tabController.index.clamp(0, _mealOptions.length - 1);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: AppTabbar(tabController: _tabController, tabs: _mealOptions),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder:
                (child, animation) => FadeTransition(opacity: animation, child: child),
            child: MealTabView(
              key: ValueKey(currentIndex),
              mealTimel: _mealOptions[_tabController.index],
            ),
          ),
        ],
      ),
    );
  }
}
