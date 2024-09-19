import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/favorite/components/Data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Saqlanganlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: likedProducts == 0
          ? Padding(
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
                  onPressed: () {
                   
                  },
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
          )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: likedProducts,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // child: TopProductsWidget(
                  //   index: index,
                  // ),
                );
              },
            ),
    );
  }
}
