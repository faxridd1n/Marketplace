import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/AppIconsPath.dart';
import '../../../core/constants/AppColors.dart';

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
          SvgPicture.asset(
            AppIcons.noLikedProduct,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sizda hali saqlangan mahsulotlar yo’q',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Keyinroq foydalanish uchun mahsulotlarni saqlab qo’yishingiz mumkin.',
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
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                'Bosh sahifaga qaytish',
                style: TextStyle(
                  color: Colors.white,
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
