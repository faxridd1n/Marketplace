import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/category/CategoryPage.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
import 'package:flutter_application_1/screens/home/HomePage.dart';
import 'package:flutter_application_1/screens/profile/ProfilePage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int bottomNavigationBarIndex = 0;
  List navigationPages = [
    const HomePage(),
    const CategoryPage(),
    const BasketPage(),
    const FavoritePage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            bottomNavigationBarIndex = value;
          });
        },
        currentIndex: bottomNavigationBarIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.green,
       
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                height: 24,
                width: 24,
              ),
              label: 'Asosiy',
              activeIcon: SvgPicture.asset(
                AppIcons.home,
                color: AppColors.primaryColor,
                height: 24,
                width: 24,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.category,
                height: 24,
                width: 24,
              ),
              label: 'Katalog',
              activeIcon: SvgPicture.asset(
                AppIcons.category,
                color: AppColors.primaryColor,
                height: 24,
                width: 24,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.shop,
                height: 24,
                width: 24,
              ),
              label: 'Savatcha',
              activeIcon: SvgPicture.asset(
                AppIcons.shop,
                height: 24,
                width: 24,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: const Icon(

                Icons.favorite_border_rounded,
                size: 24,
                color: AppColors.grey2,
              ),
              label: 'Saqlanganlar',
              activeIcon: SvgPicture.asset(
                AppIcons.likeFiilled,
                height: 24,
                color: AppColors.primaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profile,
                height: 24,
                width: 24,
              ),
              label: 'Profil',
              activeIcon: SvgPicture.asset(
                AppIcons.profile,
                color: AppColors.primaryColor,
                height: 24,
                width: 24,
              )),
        ],
      ),
      body: Center(
        child: navigationPages[bottomNavigationBarIndex],
      ),
    );
  }
}
