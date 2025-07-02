class Coupon {
  final String code;
  final int discountAmount;
  final String expiresIn;
  final String offer;

  Coupon({
    required this.code,
    required this.discountAmount,
    required this.expiresIn,
    required this.offer,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
      code: json['couponName'],
      discountAmount: json['discountAmount'] ?? 0,
      expiresIn: json['expiresIn'] ?? '',
      offer: json['offer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'couponName': code,
      'discountAmount': discountAmount,
      'expiresIn': expiresIn,
      'offer': offer,
    };
  }
}
