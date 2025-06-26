import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/date_time_utils.dart';

class ExpiryCountdown extends StatefulWidget {
  final String expiryTimeString;
  final VoidCallback onExpired;

  const ExpiryCountdown({super.key, required this.expiryTimeString, required this.onExpired});

  @override
  State<ExpiryCountdown> createState() => _ExpiryCountdownState();
}

class _ExpiryCountdownState extends State<ExpiryCountdown> {
  late Duration _timeLeft;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timeLeft = getTimeLeft(widget.expiryTimeString);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = getTimeLeft(widget.expiryTimeString);
        if (_timeLeft == Duration.zero) {
          timer.cancel();
          widget.onExpired();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Expires in: ${formatDuration(_timeLeft)}',
      style: context.bodySmall.copyWith(
        color: AppColors.green,
      ),
    );
  }
}
