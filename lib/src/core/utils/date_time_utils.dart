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

String formatCustomDate(DateTime dateTime) {
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

  final day = DateFormat('d').format(dateTime);
  final month = customMonths[dateTime.month] ?? DateFormat('MMM').format(dateTime);
  final year = DateFormat('y').format(dateTime);
  final time = DateFormat('HH:mm').format(dateTime);

  return "$day $month $year | $time PM";
}
