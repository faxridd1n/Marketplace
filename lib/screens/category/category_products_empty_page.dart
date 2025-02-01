import 'package:flutter/material.dart';

import '../../assets_path/app_images_path.dart';
import '../../core/constants/app_colors.dart';
import '../../core/language/language_constants.dart';
import '../navigation/navigation_page.dart';

class CategoryEmptyPage extends StatefulWidget {
  const CategoryEmptyPage({super.key});
  @override
  State<CategoryEmptyPage> createState() => _KatalogEmptyPageState();
}

class _KatalogEmptyPageState extends State<CategoryEmptyPage> {
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
          const SizedBox(height: 20),
          Text(
            translation(context).weCouldntFindIt,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            translation(context).tryWritingTheProductName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            maxLines: 5,
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
              Navigator.pop(context);
              HomeTabControllerProvider.of(context).controller.animateTo(0);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                translation(context).toHome,
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
