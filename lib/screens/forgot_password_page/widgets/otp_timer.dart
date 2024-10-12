import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';

class Countdown extends AnimatedWidget {
  final Animation<int>? animation;

  Countdown({
    Key? key,
    this.animation,
  }) : super(key: key, listenable: animation!);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.green,
      ),
    );
  }
}
