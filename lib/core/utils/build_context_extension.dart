import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension BuildContextExtension on BuildContext {
  Future<void> showPopUp(
    BuildContext context, {
    required String title,
    required String message,
    required bool isSucces,
    Widget? child,
  }) async {
    AnimationController? controller;
    showTopSnackBar(
      Overlay.of(this),
      child ??
          Container(
            child: isSucces
                ? Row(
                    children: [
                      // Expanded(child: Container()),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.snackBarGreen,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.snackBarGreenGradient,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.snackBarGreen,
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  // ? 'Добавлено успешно!' : 'Удален успешно!',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                    message,

                                    // addProduct
                                    //     ? '$name добавлено в корзину'
                                    //     : '$name  удалено из корзины',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                    ],
                  )
                : Row(
                    children: [
                      // Expanded(child: Container()),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: AppColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.snackBarRedGradient,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.error,
                              color: AppColors.red,
                              size: 25,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  // ? 'Добавлено успешно!' : 'Удален успешно!',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: Text(
                                    message,

                                    // addProduct
                                    //     ? '$name добавлено в корзину'
                                    //     : '$name  удалено из корзины',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                    ],
                  ),
          ),
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
