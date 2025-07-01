import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/notifications/presentation/bloc/app_notification_bloc.dart';

void initNotification() {
  sl.registerFactory<AppNotificationBloc>(() => AppNotificationBloc());
}
