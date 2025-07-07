import 'dart:ui';

import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/notifications/domain/entities/notification.dart';

extension DietTypePCExtension on DietType {
  Color getPrimaryColor() {
    switch (this) {
      case DietType.vegetarian:
      case DietType.vegan:
        return AppColors.frog;
      case DietType.nonvegetarian:
        return AppColors.bento;
    }
  }
}

extension DietTypeBGExtension on DietType {
  Color getBackgroundColor() {
    switch (this) {
      case DietType.vegan:
      case DietType.vegetarian:
        return AppColors.latte;
      case DietType.nonvegetarian:
        return AppColors.petal;
    }
  }
}

extension DietTypeExtension on DietType {
  String toDatabaseValue() {
    switch (this) {
      case DietType.vegan:
        return "VEGAN";
      case DietType.vegetarian:
        return "VEGETARIAN";
      case DietType.nonvegetarian:
        return "NONVEGETARIAN";
    }
  }

  static DietType fromDatabaseValue(String value) {
    switch (value) {
      case "VEGAN":
        return DietType.vegan;
      case "VEGETARIAN":
        return DietType.vegetarian;
      case "NONVEGETARIAN":
        return DietType.nonvegetarian;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}

extension NotificationIconExtension on NotificationType {
  AppNotification getNotification() {
    switch (this) {
      case NotificationType.ordercancelled:
        return AppNotification.initial().copyWith(
          title: "Order Cancelled!",
          description:
              "Your order has been successfully cancelled. For any concerns or assistance, our support team is ready to help via the Help Center.",
          dateTime: DateTime.now().subtract(const Duration(days: 2, hours: 5)),
          image: AppImages.orderCancelled,
          recent: true,
        );
      case NotificationType.ordersuccess:
        return AppNotification.initial().copyWith(
          title: "Order Successful!",
          description:
              "You have placed your order at Burger Hut and paid Rs.2400, Your food will arrive soon. Enjoy our services 🤩",
          dateTime: DateTime.now(),
          image: AppImages.orderSuccess,
          recent: true,
        );
      case NotificationType.newcoupon:
        return AppNotification.initial().copyWith(
          title: "New Coupons Available",
          description:
              "🍽️ Deals made just for you! Check out our latest coupons and enjoy mouth-watering meals at unbeatable prices. 🎉",
          dateTime: DateTime.now().subtract(const Duration(days: 7, hours: 8)),
          image: AppImages.newCoupon,
          recent: false,
        );
      case NotificationType.newservice:
        return AppNotification.initial().copyWith(
          title: "New Coupons Available",
          description:
              "A new service is now live on your app! Tap in to see what’s cooking — faster delivery, more options, and more rewards. 🍕🚗",
          dateTime: DateTime.now().subtract(const Duration(days: 7, hours: 3)),
          image: AppImages.newService,
          recent: false,
        );
    }
  }
}

extension DifficultyExtension on Difficulty {
  String toDatabaseValue() {
    switch (this) {
      case Difficulty.easy:
        return "EASY";
      case Difficulty.medium:
        return "MEDIUM";
      case Difficulty.hard:
        return "HARD";
    }
  }

  static Difficulty fromDatabaseValue(String value) {
    switch (value) {
      case "EASY":
        return Difficulty.easy;
      case "MEDIUM":
        return Difficulty.medium;
      case "HARD":
        return Difficulty.hard;
      default:
        throw ArgumentError("Invalid status value: $value");
    }
  }
}

extension AddressTypeExtension on AddressType {
  String get displayName {
    switch (this) {
      case AddressType.current:
        return "Current Address";
      case AddressType.home:
        return "Home";
      case AddressType.work:
        return "Work";
    }
  }
}

extension DeliverTimingExtension on DeliveryTiming {
  List<String> get displayTiming {
    switch (this) {
      case DeliveryTiming.immediately:
        return ["Immediately", "(45 mins - 1 hour)", "Might be delayed during peak hours."];
      case DeliveryTiming.evening:
        return ["Evening", " (5pm - 6pm)", "Recommended for dinner orders."];
      case DeliveryTiming.afternoon:
        return ["Afternoon", "(11am - 1pm)", "Recommended for lunch orders."];
    }
  }
}

extension ToastEnumsExtension on ToastType {
  Color getColor() {
    switch (this) {
      case ToastType.error:
        return AppColors.red;
      case ToastType.success:
        return AppColors.frog;
    }
  }
}

extension AlertTypeExtension on AlertType {
  String getTitle({String? coupon}) {
    switch (this) {
      case AlertType.welcome:
        return "Welcome!";
      case AlertType.coupon:
        return "${coupon ?? "Discount"} Coupon Added";
      case AlertType.removeitem:
        return "Item Removed From Cart";
      case AlertType.order:
        return "Your Order Has Been Placed!";
    }
  }

  String getSubtitle({String? item}) {
    switch (this) {
      case AlertType.welcome:
        return "You have logged in successfully.";
      case AlertType.coupon:
        return "Your one time coupon has been applied.";
      case AlertType.removeitem:
        return "${item ?? "One Item"} has been removed from the cart.";
      case AlertType.order:
        return "Upon receiving confirmation call you can track your order.";
    }
  }

  String get iconPath {
    switch (this) {
      case AlertType.welcome:
        return AppIcons.welcome;
      case AlertType.coupon:
        return AppIcons.discount;
      case AlertType.removeitem:
        return AppIcons.remove;
      case AlertType.order:
        return AppIcons.party;
    }
  }

  Color get titleColor {
    switch (this) {
      case AlertType.welcome:
      case AlertType.coupon:
        return AppColors.green;
      case AlertType.removeitem:
        return AppColors.bento;
      case AlertType.order:
        return AppColors.salmon;
    }
  }

  Color get subColor {
    switch (this) {
      case AlertType.welcome:
      case AlertType.coupon:
      case AlertType.order:
        return AppColors.black.withValues(alpha: 0.45);
      case AlertType.removeitem:
        return AppColors.bento.withValues(alpha: 0.45);
    }
  }

  Color get shimmerColor {
    switch (this) {
      case AlertType.welcome:
      case AlertType.coupon:
        return AppColors.shimmer.withValues(alpha: 0.45);
      case AlertType.order:
        return AppColors.salmon.withValues(alpha: 0.45);
      case AlertType.removeitem:
        return AppColors.bento.withValues(alpha: 0.45);
    }
  }
}
