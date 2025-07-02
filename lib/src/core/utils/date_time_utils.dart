import 'package:intl/intl.dart';

String formatDuration(Duration duration) {
  int minutes = duration.inMinutes;
  int seconds = duration.inSeconds % 60;
  return '${_twoDigitsTime(minutes)}:${_twoDigitsTime(seconds)}';
}

String _twoDigitsTime(int number) {
  return number.toString().padLeft(2, '0');
}

Duration getTimeLeft(String expiryTimeString) {
  final expiryTime = DateTime.parse(expiryTimeString);
  final now = DateTime.now();
  final difference = expiryTime.difference(now);
  return difference.isNegative ? Duration.zero : difference;
}

String getCustomMonth(int month) {
  const customMonths = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  return customMonths[month] ?? '';
}

String formatCustomDateTime(DateTime dateTime) {
  final day = DateFormat('d').format(dateTime);
  final month = getCustomMonth(dateTime.month);
  final year = DateFormat('y').format(dateTime);
  final time = DateFormat('HH:mm').format(dateTime);

  return "$day $month $year | $time PM";
}

String formatCustomDate(DateTime dateTime) {
  final day = DateFormat('d').format(dateTime); // e.g., '11'
  final month = getCustomMonth(dateTime.month); // e.g., 'Jan'

  return "$month $day"; // e.g., 'Jan 11'
}
