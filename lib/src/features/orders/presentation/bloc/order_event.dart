part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class SelectAddress extends OrderEvent {
  final AddressType addressType;
  const SelectAddress(this.addressType);

  @override
  List<Object> get props => [addressType];
}

class ChangeDeliveryTiming extends OrderEvent {
  final DeliveryTiming timing;
  const ChangeDeliveryTiming(this.timing);

  @override
  List<Object> get props => [timing];
}

class PlaceOrder extends OrderEvent {
  final ProductOrder order;

  const PlaceOrder({required this.order});
  @override
  List<Object> get props => [order];
}

class GetAllOrders extends OrderEvent {
  const GetAllOrders();
}
