import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension BuildContextExtension on BuildContext {
  Future<void> showPopUp(
    BuildContext context, {
    String title = 'Добавлено успешно!',
    required String message,
    Widget? child,
  }) async {
    AnimationController? controller;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          Container(),
      displayDuration: const Duration(seconds: 3),
      dismissType: DismissType.onSwipe,
      curve: Curves.decelerate,
      reverseCurve: Curves.linear,
      onAnimationControllerInit: (ctrl) => controller = ctrl,
      animationDuration: const Duration(milliseconds: 400),
      reverseAnimationDuration: const Duration(milliseconds: 200),
    );
  }
}
