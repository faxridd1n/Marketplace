import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';

class Countdown extends AnimatedWidget {
  final Animation<int>? animation;

  Countdown({
    super.key,
    this.animation,
  }) : super(listenable: animation!);

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation!.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.green,
      ),
    );
  }
}
