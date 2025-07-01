import 'package:uuid/uuid.dart';

class AppNotification {
  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String image;
  final bool recent;
  AppNotification({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.image,
    required this.recent,
  });

  factory AppNotification.initial() => AppNotification(
    id: Uuid().v4(),
    title: '',
    description: '',
    dateTime: DateTime.now(),
    image: '',
    recent: false,
  );

  AppNotification copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dateTime,
    String? image,
    bool? recent,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      image: image ?? this.image,
      recent: recent ?? this.recent,
    );
  }
}
