import 'dart:ui';

import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';

extension FoodMarkExtension on FoodMark {
  Color getPrimaryColor() {
    switch (this) {
      case FoodMark.veg:
        return AppColors.frog;
      case FoodMark.nonveg:
        return AppColors.bento;
    }
  }
}

extension FoodMarkBGExtension on FoodMark {
  Color getBackgroundColor() {
    switch (this) {
      case FoodMark.veg:
        return AppColors.latte;
      case FoodMark.nonveg:
        return AppColors.petal;
    }
  }
}
