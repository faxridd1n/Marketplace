import 'package:flutter/material.dart';
// import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/drawer/drawer_pages/AboutUsPage.dart';
import 'package:flutter_application_1/screens/drawer/drawer_pages/NormativeDocsPage.dart';
// import 'package:flutter_application_1/screens/home/widgets/HomePopUp.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  bool popUpIsOpen = false;
  String selectedItem = 'O\'zbekcha';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 80,
            child: DrawerHeader(
              padding: const EdgeInsets.only(right: 10, left: 5),
              margin: const EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: AppColors.grey3,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const AboutUsPage(),
                ),
              );
            },
            child: const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Biz haqimizda'),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => const NormativeDocsPage(),
                ),
              );
            },
            child: const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Me\'yoriy xujjatlar'),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Narxni hisoblash'),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
