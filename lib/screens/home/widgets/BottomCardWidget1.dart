import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _BottomInfoWidget1State extends State<BottomInfoWidget1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.grey1,
      child: Column(
        children: [
          SvgPicture.asset(
            AppIcons.taqsimLogo,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text('© 2022 «Taqsim»'),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          BottomCardWidget1(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '©Taqsim 2020–2022. Все права защищены. Указанная в интернет-магазине цена товаров и условия их приобретения действительны на текущую дату.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grey2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BottomCardWidget1 extends StatefulWidget {
  BottomCardWidget1({super.key});

  @override
  State<BottomCardWidget1> createState() => _BottomCardWidget1State();
}

class _BottomCardWidget1State extends State<BottomCardWidget1> {
  bool isDropButton1Open = false;
  bool isDropButton2Open = false;
  bool isDropButton3Open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:AppColors.white,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            shape: Border.all(color:AppColors.transparent),
            iconColor: AppColors.green,
            title: const Text(
              'Покупателям',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            children: const <Widget>[
              ListTile(
                minTileHeight: 30,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Доставка',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Способы оплаты',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Рассрочка',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Профиль',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: AppColors.grey2,
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            shape: Border.all(color:AppColors.transparent),
            iconColor: AppColors.green,
            title: const Text(
              'Taqsim',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            children: const <Widget>[
              ListTile(
                minTileHeight: 30,
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'О компании',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Наш блог',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Наши партнеры',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Поддержка',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: AppColors.grey2,
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            shape: Border.all(color:AppColors.transparent),
            iconColor: AppColors.green,
            title: const Text(
              'Правовая информация',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            children: const <Widget>[
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Политика конфиденциальности',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Условия использования',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                minVerticalPadding: 0,
                minTileHeight: 30,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  'Правила сервиса',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: AppColors.grey2,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            '998 97 123-45-67',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Служба поддержки 24/7'),
           const SizedBox(
            height: 25,
          ),
          const Text(
            'support@taqsim.uz',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Почта'),
          const SizedBox(
            height: 10,
          ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.instagram,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.facebook,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.telegram,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomInfoWidget1 extends StatefulWidget {
  const BottomInfoWidget1({super.key});

  @override
  State<BottomInfoWidget1> createState() => _BottomInfoWidget1State();
}
