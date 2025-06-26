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
