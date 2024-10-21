import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class BuyNowDropDownWidget extends StatefulWidget {
  const BuyNowDropDownWidget({super.key});

  @override
  State<BuyNowDropDownWidget> createState() => _BuyNowDropDownWidgetState();
}

class _BuyNowDropDownWidgetState extends State<BuyNowDropDownWidget> {
  List<String> regions = [
    'Сырдарьинская область',
    'Хорезмская область',
    'Кашкадарьинская область',
    'Самаркандская область',
    'Республика Каракалпакстан',
    'Ферганская область',
    'Бухарская область',
    'Сурхандарьинская область',
    'Наманганская область',
    'Навоийская область',
    'Андижанская область',
    'Джизакская область',
    'Ташкентская область',
    'город Ташкент',
  ];
  String selectedRegion = '';
  bool popUpIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color:AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      offset: const Offset(0, 50),
      onSelected: (value) {
        selectedRegion = value.toString();
        popUpIsOpen = false;
        setState(() {});
      },
      onOpened: () {
        popUpIsOpen = true;
        setState(() {});
      },
      onCanceled: () {
        popUpIsOpen = false;
        setState(() {});
      },
      initialValue: selectedRegion.isEmpty ? regions[0] : selectedRegion,
      icon: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Text(
            selectedRegion.isEmpty ? regions[0] : selectedRegion,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            popUpIsOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          ),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return regions.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
