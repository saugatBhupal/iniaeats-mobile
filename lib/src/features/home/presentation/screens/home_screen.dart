import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:inaeats/src/features/home/presentation/screens/browse_screen.dart';
import 'package:inaeats/src/features/home/presentation/widgets/components/home_app_bar.dart';
import 'package:inaeats/src/features/home/presentation/widgets/components/home_body.dart';
import 'package:inaeats/src/features/home/presentation/widgets/components/home_bottom_nav_bar.dart';
import 'package:inaeats/src/features/offers/presentation/screens/offers_screen.dart';
import 'package:inaeats/src/features/orders/presentation/screens/all_orders_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current is ScreenModuleChanged;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: state is ScreenModuleChanged && state.index != 0 ? null : const HomeAppBar(),
          body: state is! ScreenModuleChanged ? HomeBody() : _getHomeBodyModule(state.index),
          bottomNavigationBar: const HomeBottomNavBar(),
        );
      },
    );
  }

  Widget _getHomeBodyModule(int index) {
    switch (index) {
      case 0:
        return HomeBody();
      case 1:
        return AllOrdersScreen();
      case 2:
        return BrowseScreen();
      case 3:
        return OffersScreen();
      case 4:
        return OffersScreen();
      default:
        return HomeBody();
    }
  }
}
