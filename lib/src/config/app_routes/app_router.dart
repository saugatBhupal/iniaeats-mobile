import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/config/app_routes/no_route_found.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:inaeats/src/features/cart/presentation/screens/cart_screen.dart';
import 'package:inaeats/src/features/categories/presentation/screens/categories_screen.dart';
import 'package:inaeats/src/features/coupons/presentation/screens/coupons_screen.dart';
import 'package:inaeats/src/features/customer_service/presentation/screens/customer_service_screen.dart';
import 'package:inaeats/src/features/home/presentation/screens/home_screen.dart';
import 'package:inaeats/src/features/meals/presentation/screens/meal_details_screen.dart';
import 'package:inaeats/src/features/meals/presentation/screens/meal_details_screen_test.dart';
import 'package:inaeats/src/features/notifications/presentation/screens/notification_screen.dart';
import 'package:inaeats/src/features/offers/presentation/screens/offers_screen.dart';
import 'package:inaeats/src/features/recipe/presentation/screens/recipe_screen.dart';
import 'package:inaeats/src/features/search/presentation/screens/search_results_screen.dart';
import 'package:inaeats/src/features/search/presentation/screens/search_screen.dart';
import 'package:inaeats/src/features/splash/presentation/screens/onboarding_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(builder: (context) => const NoRouteFound());
      case AppRoutes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case AppRoutes.authentication:
        return MaterialPageRoute(
          builder:
              (context) => AuthenticationScreen(authType: AuthType.register),
        );
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutes.categories:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case AppRoutes.offers:
        return MaterialPageRoute(builder: (context) => const OffersScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case AppRoutes.customerService:
        return MaterialPageRoute(
          builder: (context) => const CustomerServiceScreen(),
        );
      case AppRoutes.search:
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case AppRoutes.searchResults:
        return MaterialPageRoute(
          builder: (context) => const SearchResultsScreen(),
        );
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case AppRoutes.coupons:
        return MaterialPageRoute(builder: (context) => const CouponsScreen());
      case AppRoutes.recipe:
        return MaterialPageRoute(builder: (context) => const RecipeScreen());
      case AppRoutes.mealDetailsTest:
        return MaterialPageRoute(builder: (context) => MealDetailsScreenTest());
      case AppRoutes.mealDetails:
        return MaterialPageRoute(builder: (context) => MealDetailsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteFound());
    }
  }
}
