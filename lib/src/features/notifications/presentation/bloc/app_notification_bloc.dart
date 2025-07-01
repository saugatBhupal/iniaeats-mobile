import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';

part 'app_notification_event.dart';
part 'app_notification_state.dart';

class AppNotificationBloc extends Bloc<AppNotificationEvent, AppNotificationState> {
  AppNotificationBloc() : super(AppNotificationInitial()) {
    on<AppNotificationEvent>((event, emit) {
      if (event is ClearNotification) {
        _clearNotification(event, emit);
      }
    });
  }
  final List<NotificationType> _notification = [
    NotificationType.ordersuccess,
    NotificationType.ordercancelled,
    NotificationType.newcoupon,
    NotificationType.newservice,
  ];
  List<NotificationType> get notification => _notification;

  void _clearNotification(ClearNotification event, Emitter<AppNotificationState> emit) {
    _notification.clear();
    emit(NotificationCleared(notification.length));
  }
}
