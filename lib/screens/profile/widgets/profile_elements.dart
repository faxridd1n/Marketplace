import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/profile/other_pages/add_card_page.dart';
import 'package:flutter_application_1/screens/profile/other_pages/contracts_page.dart';
import 'package:flutter_application_1/screens/profile/other_pages/personal_data_page.dart';
import 'package:flutter_application_1/screens/profile/other_pages/scoring_page.dart';
import 'package:flutter_application_1/screens/profile/widgets/log_out_diolog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileElements extends StatefulWidget {
  const ProfileElements({super.key});

  @override
  State<ProfileElements> createState() => _ProfileElementsState();
}

class _ProfileElementsState extends State<ProfileElements> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey3, width: 0.5),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const PersonalDataPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.personalData,
                        color: AppColors.green,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Личные данные',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 0,
                indent: 0,
                thickness: 0.5,
                color: AppColors.grey3,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const ScoringPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.personalData,
                        color: AppColors.green,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Скоринг',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 0,
                indent: 0,
                thickness: 0.5,
                color: AppColors.grey3,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const AddCardPage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.profileCard,
                        color: AppColors.green,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        'Мои карты',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 0,
                indent: 0,
                thickness: 0.5,
                color: AppColors.grey3,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                    MaterialPageRoute(
                      builder: (context) => const ContractsPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.percent_rounded,
                        color: AppColors.green,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Контракты',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        InkWell(
          onTap: () {
            logOutDiolog(context);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.grey3, width: 0.5),
            ),
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppIcons.logout,
                  color: AppColors.green,
                ),
                const SizedBox(width: 15),
                const Text(
                  'Выйти',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
