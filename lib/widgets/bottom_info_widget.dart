import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_card_expansion_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../assets_path/app_icons_path.dart';
import '../core/constants/app_colors.dart';

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
          const BottomCardWidget(),
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
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromARGB(39, 0, 0, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color:AppColors.white,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ExpansionTileWidget(),
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
