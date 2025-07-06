import 'package:inaeats/src/core/constants/app_enums.dart';

class Coupon {
  final String code;
  final int discountValue;
  final DiscountType discountType;
  final DateTime expiresIn;
  final String offer;

  Coupon({
    required this.code,
    required this.discountValue,
    required this.discountType,
    required this.expiresIn,
    required this.offer,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      code: json['couponName'],
      discountValue: json['discountValue'] ?? 0,
      discountType: _parseDiscountType(json['discountType']),
      expiresIn: DateTime.parse(json['expiresIn']),
      offer: json['offer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'couponName': code,
      'discountValue': discountValue,
      'discountType': discountType.name,
      'expiresIn': expiresIn.toIso8601String(),
      'offer': offer,
    };
  }

  static DiscountType _parseDiscountType(String? raw) {
    switch (raw?.toLowerCase()) {
      case 'percent':
        return DiscountType.percent;
      case 'amount':
      default:
        return DiscountType.amount;
    }
  }

  int calculateDiscount(int subtotal) {
    if (discountType == DiscountType.percent) {
      return ((subtotal * discountValue) / 100).round();
    } else {
      return discountValue;
    }
  }

  int getValidDiscount(int subtotal) {
    final discount = calculateDiscount(subtotal);
    return discount > subtotal ? subtotal : discount;
  }

  bool get isExpired => DateTime.now().isAfter(expiresIn);
}
