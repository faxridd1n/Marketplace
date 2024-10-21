import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({super.key});

  @override
  ExpansionTileWidgetState createState() => ExpansionTileWidgetState();
}

class ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  List<bool> isOpen = [false, false, false]; // Track open/close state

  void _handleExpansion(int index, bool isExpanded) {
    setState(() {
      for (int i = 0; i < isOpen.length; i++) {
        if (i == index) {
          isOpen[i] = isExpanded; // Open the clicked tile
        } else {
          isOpen[i] = false; // Close others
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        _buildExpansionTile(0, 'Покупателям', [
          'Доставка',
          'Способы оплаты',
          'Рассрочка',
          'Профиль',
        ]),
          const Divider(
            height: 0.5,
            color: AppColors.grey3,
          ),
         
        _buildExpansionTile(1, 'Taqsim', [
          'О компании',
          'Наш блог',
          'Наши партнеры',
          'Поддержка',
        ]),
          const Divider(
            height: 0.5,
            color: AppColors.grey3,
          ),
         
        _buildExpansionTile(2, 'Правовая информация', [
          'Политика конфиденциальности',
          'Условия использования',
          'Правила сервиса',
        ]),
          const Divider(
            height: 0.5,
            color: AppColors.grey3,
          ),
         
        // Add more ExpansionTiles as needed
      ],
    );
  }

  ExpansionTile _buildExpansionTile(int index, String title, List<String> items) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      shape: Border.all(color:AppColors.transparent),
      iconColor:AppColors.green,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onExpansionChanged: (isExpanded) => _handleExpansion(index, isExpanded),
      initiallyExpanded: isOpen[index],
      children: items
          .map(
            (item) => ListTile(
              minTileHeight: 30,
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                item,
                style: const TextStyle(
                  color:AppColors.grey2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
