part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object?> get props => [];
}

final class OrderInitial extends OrderState {
  const OrderInitial();
}

final class AddressChanged extends OrderState {
  final AddressType selectedAddress;

  const AddressChanged({required this.selectedAddress});

  @override
  List<Object?> get props => [selectedAddress];
}

final class DeliveryTimingChanged extends OrderState {
  final DeliveryTiming deliveryTiming;
  const DeliveryTimingChanged({required this.deliveryTiming});

  @override
  List<Object?> get props => [deliveryTiming];
}

class PlaceOrderLoading extends OrderState {}

class PlaceOrderSuccess extends OrderState {
  final ProductOrder order;

  const PlaceOrderSuccess({required this.order});

  @override
  List<Object?> get props => [order];
}

class PlaceOrderFailed extends OrderState {
  final String message;

  const PlaceOrderFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class GetAllOrdersLoading extends OrderState {}

class GetAllOrdersSuccess extends OrderState {
  final List<ProductOrder> orders;

  const GetAllOrdersSuccess({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class GetAllOrdersFailed extends OrderState {
  final String message;

  const GetAllOrdersFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

