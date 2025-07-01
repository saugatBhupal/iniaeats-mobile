part of 'app_notification_bloc.dart';

sealed class AppNotificationEvent extends Equatable {
  const AppNotificationEvent();

  @override
  List<Object> get props => [];
}

class ClearNotification extends AppNotificationEvent {
  const ClearNotification();
}

class LoadNotifications extends AppNotificationEvent {}
