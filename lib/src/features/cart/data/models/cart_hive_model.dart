import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cart_hive_model.g.dart';

@HiveType(typeId: 0)
class CartHiveModel extends Equatable {
  @HiveField(0)
  final String productId;
  @HiveField(1)
  final int quantity;

  const CartHiveModel({required this.productId, required this.quantity});

  @override
  List<Object?> get props => [];
}
