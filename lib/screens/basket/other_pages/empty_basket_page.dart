import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';

import '../../../assets_path/app_images_path.dart';
import '../../../core/constants/app_colors.dart';

class EmptyBasketPage extends StatelessWidget {
  const EmptyBasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.emptyBasket,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            translation(context).yourBasketIsEmpty,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            translation(context).youCanStartShopping,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.green,
            ),
            onPressed: () {
              HomeTabControllerProvider.of(context).controller.animateTo(0);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                translation(context).startShopping,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
