import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/screens/navigation/navigation_page.dart';
import '../../../core/constants/app_colors.dart';

class EmptyFavouritePage extends StatefulWidget {
  const EmptyFavouritePage({super.key});

  @override
  State<EmptyFavouritePage> createState() => _EmptyFavouritePageState();
}

class _EmptyFavouritePageState extends State<EmptyFavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.noItems,
            width: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'У вас нет сохранённых товаров',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Вы можете сохранить товары для использования позже.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(
            height: 20,
          ),
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
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                'На главную',
                style: TextStyle(
                  color:AppColors.white,
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
