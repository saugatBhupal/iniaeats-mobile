import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';

class AppTabbar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;
  const AppTabbar({super.key, required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.symmetric(horizontal: 13),
      padding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      indicator: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.frog, AppColors.veggie],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(68, 199, 73, 0.35),
            offset: const Offset(1, 1),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      dividerHeight: 0,
      labelStyle: _textTheme.bodyLarge!.copyWith(color: AppColors.white),
      unselectedLabelStyle: _textTheme.bodyLarge!.copyWith(
        color: AppColors.black.withValues(alpha: 0.45),
      ),
      splashFactory: NoSplash.splashFactory,
      tabs: tabs.map((tab) => Tab(child: Text(tab))).toList(),
    );
  }
}
