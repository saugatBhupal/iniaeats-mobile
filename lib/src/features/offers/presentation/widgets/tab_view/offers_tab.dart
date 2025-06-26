import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/tabbar/app_tabbar.dart';
import 'package:inaeats/src/features/offers/presentation/widgets/tab_view/offers_tab_view.dart';

class OffersTab extends StatefulWidget {
  const OffersTab({super.key});

  @override
  State<OffersTab> createState() => _OffersTabState();
}

class _OffersTabState extends State<OffersTab> with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> offers = [
    AppStrings.trending,
    AppStrings.promo,
    AppStrings.valueMon,
    AppStrings.discounts,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: offers.length, vsync: this);
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
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: AppTabbar(tabController: _tabController, tabs: offers),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder:
                (child, animation) => FadeTransition(opacity: animation, child: child),
            child: OffersTabView(
              key: ValueKey(_tabController.index),
              offers: offers[_tabController.index],
            ),
          ),
        ],
      ),
    );
  }
}
