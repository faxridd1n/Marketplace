import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/home/drawer/drawer_pages/AboutUsPage.dart';
import 'package:flutter_application_1/screens/home/drawer/drawer_pages/NormativeDocsPage.dart';
import 'package:flutter_application_1/screens/home/widgets/HomePopUp.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({super.key});

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
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeDrawer();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: AppColors.grey3,
                    ),
                  ),
                  Expanded(child: Container()),
                  HomePopUpMenuWidget(true, AppIcons.language)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsPage(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NormativeDocsPage(),
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
