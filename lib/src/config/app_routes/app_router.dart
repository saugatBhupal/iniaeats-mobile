import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/config/app_routes/no_route_found.dart';
import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:inaeats/src/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:inaeats/src/features/cart/presentation/screens/cart_screen.dart';
import 'package:inaeats/src/features/categories/presentation/screens/categories_screen.dart';
import 'package:inaeats/src/features/coupons/presentation/screens/coupons_screen.dart';
import 'package:inaeats/src/features/customer_service/presentation/screens/customer_service_screen.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:inaeats/src/features/home/presentation/screens/home_screen.dart';
import 'package:inaeats/src/features/notifications/presentation/bloc/app_notification_bloc.dart';
import 'package:inaeats/src/features/products/presentation/screens/meal_details_screen.dart';
import 'package:inaeats/src/features/notifications/presentation/screens/notification_screen.dart';
import 'package:inaeats/src/features/offers/presentation/screens/offers_screen.dart';
import 'package:inaeats/src/features/orders/presentation/screens/all_orders_screen.dart';
import 'package:inaeats/src/features/orders/presentation/screens/order_screen.dart';
import 'package:inaeats/src/features/orders/presentation/screens/track_orders_screen.dart';
import 'package:inaeats/src/features/recipe/presentation/screens/recipe_screen.dart';
import 'package:inaeats/src/features/search/presentation/bloc/search_bloc.dart';
import 'package:inaeats/src/features/search/presentation/screens/search_results_screen.dart';
import 'package:inaeats/src/features/search/presentation/screens/search_screen.dart';
import 'package:inaeats/src/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:inaeats/src/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:inaeats/src/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();
  static final _authBloc = sl<AuthenticationBloc>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(builder: (context) => const NoRouteFound());
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder:
              (context) =>
                  BlocProvider(create: (context) => sl<SplashBloc>(), child: const SplashScreen()),
        );
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case AppRoutes.authentication:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider<AuthenticationBloc>.value(
                value: _authBloc,
                child: AuthenticationScreen(authType: AuthType.login),
              ),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder:
              (context) =>
                  BlocProvider(create: (context) => sl<HomeBloc>(), child: const HomeScreen()),
        );
      case AppRoutes.categories:
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      case AppRoutes.offers:
        return MaterialPageRoute(builder: (context) => const OffersScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => sl<AppNotificationBloc>(),
                child: const NotificationScreen(),
              ),
        );
      case AppRoutes.customerService:
        return MaterialPageRoute(builder: (context) => const CustomerServiceScreen());
      case AppRoutes.search:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (_) => sl<SearchBloc>()..add(GetRecommendedProducts()),
                child: const SearchScreen(),
              ),
        );
      case AppRoutes.searchResults:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => sl<SearchBloc>(),
                child: SearchResultsScreen(query: settings.arguments as String),
              ),
        );
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case AppRoutes.coupons:
        return MaterialPageRoute(builder: (context) => const CouponsScreen());
      case AppRoutes.recipe:
        return MaterialPageRoute(builder: (context) => const RecipeScreen());
      case AppRoutes.mealDetails:
        return MaterialPageRoute(builder: (context) => MealDetailsScreen());
      case AppRoutes.allOrders:
        return MaterialPageRoute(builder: (context) => AllOrdersScreen());
      case AppRoutes.orders:
        return MaterialPageRoute(builder: (context) => OrderScreen());
      case AppRoutes.trackOrders:
        return MaterialPageRoute(builder: (context) => TrackOrdersScreen());
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteFound());
    }
  }
}
