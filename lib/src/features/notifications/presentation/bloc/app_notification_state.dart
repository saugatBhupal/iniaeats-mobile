part of 'app_notification_bloc.dart';

sealed class AppNotificationState extends Equatable {
  const AppNotificationState();

  @override
  List<Object> get props => [];
}

final class AppNotificationInitial extends AppNotificationState {}

class NotificationCleared extends AppNotificationState {
  final int index;

  const NotificationCleared(this.index);
  @override
  List<Object> get props => [index];
}

class NotificationsLoaded extends AppNotificationState {
  final List<NotificationType> notifications;

  const NotificationsLoaded(this.notifications);
  @override
  List<Object> get props => [notifications];
}
