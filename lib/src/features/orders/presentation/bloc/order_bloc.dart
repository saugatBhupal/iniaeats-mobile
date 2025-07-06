import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/orders/domain/entities/product_order.dart';
import 'package:inaeats/src/features/orders/domain/repositories/get_all_orders_usecase.dart';
import 'package:inaeats/src/features/orders/domain/usecases/place_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final PlaceOrderUsecase placeOrderUsecase;
  final GetAllOrdersUsecase getAllOrdersUsecase;
  OrderBloc({required this.placeOrderUsecase, required this.getAllOrdersUsecase})
    : super(const OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is SelectAddress) {
        _selectAddress(event, emit);
      }
      if (event is ChangeDeliveryTiming) {
        _changeDeliveryTiming(event, emit);
      }
      if (event is PlaceOrder) {
        await _placeOrder(event, emit);
      }
      if (event is GetAllOrders) {
        await _getAllOrders(event, emit);
      }
    });
  }
  AddressType _addressType = AddressType.current;
  AddressType get addressType => _addressType;

  DeliveryTiming _deliveryTiming = DeliveryTiming.immediately;
  DeliveryTiming get deliveryTiming => _deliveryTiming;

  void _selectAddress(SelectAddress event, Emitter<OrderState> emit) {
    emit(AddressChanged(selectedAddress: event.addressType));
    _addressType = event.addressType;
  }

  void _changeDeliveryTiming(ChangeDeliveryTiming event, Emitter<OrderState> emit) {
    emit(DeliveryTimingChanged(deliveryTiming: event.timing));
    _deliveryTiming = event.timing;
  }

  Future<void> _placeOrder(PlaceOrder event, Emitter<OrderState> emit) async {
    emit(PlaceOrderLoading());
    try {
      final result = await placeOrderUsecase.call(event.order);
      result.fold(
        (failure) => emit(PlaceOrderFailed(message: failure.message)),
        (success) => emit(PlaceOrderSuccess(order: success)),
      );
    } catch (e) {
      emit(PlaceOrderFailed(message: "Error: ${e.toString()}"));
    }
  }

  final List<ProductOrder> _orders = [];
  List<ProductOrder> get orders => _orders;

  Future<void> _getAllOrders(GetAllOrders event, Emitter<OrderState> emit) async {
    emit(GetAllOrdersLoading());
    try {
      final result = await getAllOrdersUsecase.call();
      result.fold((failure) => emit(GetAllOrdersFailed(message: failure.message)), (success) {
        _orders
          ..clear()
          ..addAll(success);
        print(_orders.length);
        emit(GetAllOrdersSuccess(orders: success));
      });
    } catch (e) {
      emit(GetAllOrdersFailed(message: "Error: ${e.toString()}"));
    }
  }
}
