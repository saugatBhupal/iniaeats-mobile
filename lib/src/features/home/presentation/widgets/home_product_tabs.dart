import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:inaeats/src/features/home/presentation/widgets/tab_view/meal_tab_view.dart';
import 'package:inaeats/src/core/widgets/tabbar/app_tabbar.dart';

class HomeProductTabs extends StatefulWidget {
  const HomeProductTabs({super.key});

  @override
  State<HomeProductTabs> createState() => _HomeProductTabsState();
}

class _HomeProductTabsState extends State<HomeProductTabs> with TickerProviderStateMixin {
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
      if (!_tabController.indexIsChanging) {
        final currentMeal = _mealOptions[_tabController.index].toLowerCase();
        context.read<HomeBloc>().add(SwitchMealTabs(currentMeal));
        setState(() {});
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(SwitchMealTabs(_mealOptions[0].toLowerCase()));
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

    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is SwitchMealTabError) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      child: Padding(
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
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return MealTabView(
                    key: ValueKey(currentIndex),
                    products: context.read<HomeBloc>().mealTabProducts,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
