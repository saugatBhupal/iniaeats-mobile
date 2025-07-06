import 'package:equatable/equatable.dart';
import 'package:inaeats/src/features/cart/domain/entities/cart.dart';
import 'package:inaeats/src/features/cart/domain/entities/coupon.dart';

class CartSummary extends Equatable {
  final int subtotal;
  final int vat;
  final int deliveryFee;
  final int discount;
  final int totalPayable;

  const CartSummary({
    required this.subtotal,
    required this.vat,
    required this.deliveryFee,
    required this.discount,
    required this.totalPayable,
  });
  factory CartSummary.initial() {
    return CartSummary(subtotal: 0, vat: 0, deliveryFee: 120, discount: 0, totalPayable: 0);
  }
  factory CartSummary.fromCartItems(List<Cart> items, {Coupon? coupon}) {
    final subtotal = items.fold(0, (sum, item) => sum + item.product.price * item.quantity);
    final vat = (subtotal * 0.13).round();
    final deliveryFee = 120;

    int discount = 0;
    if (coupon != null) {
      discount = coupon.getValidDiscount(subtotal);
    } else {}

    final totalPayable = subtotal + vat + deliveryFee - discount;

    return CartSummary(
      subtotal: subtotal,
      vat: vat,
      deliveryFee: deliveryFee,
      discount: discount,
      totalPayable: totalPayable,
    );
  }

  @override
  List<Object?> get props => [subtotal, vat, deliveryFee, discount, totalPayable];
}
