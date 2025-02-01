import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/other_pages/add_new_card_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/app_icons_path.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';

class UserCardsEmptyPage extends StatelessWidget {
  const UserCardsEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.appBarShadowColor,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'My Cards',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SvgPicture.asset(
                  AppIcons.emptyCards,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                translation(context).youHaventAddedAnyCardsYet,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                translation(context).enterYourCardDetails,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const AddNewCardPage(),
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
                  'Add Card',
                  style: TextStyle(
                    color: AppColors.white,
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
