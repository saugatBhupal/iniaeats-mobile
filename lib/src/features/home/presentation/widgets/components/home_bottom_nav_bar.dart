import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is ScreenModuleChanged) {
          currentIndex = state.index;
        }
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.frog,
          unselectedItemColor: AppColors.black.withValues(alpha: 0.45),
          onTap: (index) {
            context.read<HomeBloc>().add(ChangeScreenModule(index));
          },
          items: [
            _bottomNavIcon(AppIcons.home, AppStrings.home, context.isTablet ? 36 : null),
            _bottomNavIcon(AppIcons.orders, AppStrings.orders, context.isTablet ? 38 : null),
            _bottomNavIcon(AppIcons.browse, AppStrings.browse, context.isTablet ? 46 : null),
            _bottomNavIcon(AppIcons.offers, AppStrings.offers, context.isTablet ? 38 : null),
            _bottomNavIcon(AppIcons.profile, AppStrings.profile, context.isTablet ? 36 : null),
          ],
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, height: 1),
          unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.black.withValues(alpha: 0.45),
            height: 1,
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavIcon(String selectedIconPath, String label, double? height) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(selectedIconPath, height: height),
      activeIcon: SvgPicture.asset(
        selectedIconPath,
        colorFilter: ColorFilter.mode(AppColors.frog, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
     