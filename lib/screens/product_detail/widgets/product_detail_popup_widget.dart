// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProductDetailPopUpWidget extends StatefulWidget {
  const ProductDetailPopUpWidget({super.key});

  @override
  State<ProductDetailPopUpWidget> createState() =>
      _ProductDetailPopUpWidgetState();
}

class _ProductDetailPopUpWidgetState extends State<ProductDetailPopUpWidget> {
  String selectedItem = '';
  bool popUpIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shadowColor:AppColors.transparent,
      color:AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      offset: const Offset(0, 50),
      onSelected: (value) {
        selectedItem = value.toString();
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
      initialValue: selectedItem.isEmpty ? 'So\'ngilari' : selectedItem,
      icon: Row(
        children: [
          Text(
            selectedItem.isEmpty ? 'So\'ngilari' : selectedItem,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            popUpIsOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 20,
          )
        ],
      ),
      itemBuilder: (BuildContext context) {
        return {
          'So\'ngilari',
          'Bir haftalik',
          'Bir oylik',
        }.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
