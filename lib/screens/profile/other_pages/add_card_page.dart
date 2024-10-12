import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/screens/profile/other_pages/add_new_card_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/AppColors.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        shadowColor: const Color.fromARGB(87, 0, 0, 0),
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'Мои карты',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) =>const AddNewCardPage(),
              ),
            );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.grey2,
                radius: 30,
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.wallet,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'У вас нет добавлена банковская карта',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey2,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                 Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (context) =>const AddNewCardPage(),
              ),
            );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.green,
                ),
                child: const Text(
                  'Добавить',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
