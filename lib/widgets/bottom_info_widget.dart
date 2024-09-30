import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_card_expansion_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../assets_path/AppIconsPath.dart';
import '../core/constants/AppColors.dart';

class BottomInfoWidget extends StatefulWidget {
  const BottomInfoWidget({super.key});

  @override
  State<BottomInfoWidget> createState() => _BottomInfoWidgetState();
}

class _BottomInfoWidgetState extends State<BottomInfoWidget> {
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
            height: 10,
          ),
          const Text('© 2022 «Taqsim»'),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          BottomCardWidget(),
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

class BottomCardWidget extends StatefulWidget {
  const BottomCardWidget({super.key});

  @override
  State<BottomCardWidget> createState() => _BottomCardWidgetState();
}

class _BottomCardWidgetState extends State<BottomCardWidget> {
  bool isDropButton1Open = false;
  bool isDropButton2Open = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ExpansionTile(
          //   tilePadding: const EdgeInsets.all(0),
          //   shape: Border.all(color: Colors.transparent),
          //   iconColor: AppColors.green,
          //   title: const Text(
          //     'Покупателям',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   children: const <Widget>[
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Доставка',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minVerticalPadding: 0,
          //       minTileHeight: 30,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Способы оплаты',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minVerticalPadding: 0,
          //       minTileHeight: 30,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Рассрочка',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minVerticalPadding: 0,
          //       minTileHeight: 30,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Профиль',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const Divider(
          //   height: 1,
          //   color: AppColors.grey2,
          // ),
          // ExpansionTile(
          //   iconColor: AppColors.green,
          //   tilePadding: const EdgeInsets.all(0),
          //   shape: Border.all(color: Colors.transparent),
          //   title: const Text(
          //     'Taqsim',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   children: const <Widget>[
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'О компании',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Наш блог',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Наши партнеры',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Поддержка',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const Divider(
          //   height: 1,
          //   color: AppColors.grey2,
          // ),
          // ExpansionTile(
          //   iconColor: AppColors.green,
          //   tilePadding: const EdgeInsets.all(0),
          //   shape: Border.all(color: Colors.transparent),
          //   title: const Text(
          //     'Правовая информация',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          //   children: const <Widget>[
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Политика конфиденциальности',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Условия использования',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //     ListTile(
          //       minTileHeight: 30,
          //       minVerticalPadding: 0,
          //       contentPadding: EdgeInsets.all(0),
          //       title: Text(
          //         'Правила сервиса',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 14,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
         ExpansionTileWidget(),
         
         
         const SizedBox(height: 20),
          const Text(
            '998 97 123-45-67',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text('Служба поддержки 24/7'),
          const SizedBox(height: 20),
          const Text(
            'support@taqsim.uz',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text('Почта'),
          const SizedBox(height: 10),
          const Text(
            '©Taqsim 2020–2022. Все права защищены. Указанная в интернет-магазине цена товаров и условия их приобретения действительны на текущую дату.',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
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
