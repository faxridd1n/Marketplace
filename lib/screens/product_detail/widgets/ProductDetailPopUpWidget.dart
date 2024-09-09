// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ProductDetailPopUpWidget extends StatefulWidget {
  ProductDetailPopUpWidget({super.key});

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
      shadowColor: Colors.transparent,
      color: Colors.white,
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
      initialValue: selectedItem.length < 1 ? 'So\'ngilari' : selectedItem,
      icon: Row(
        children: [
          Text(
            selectedItem.length < 1 ? 'So\'ngilari' : selectedItem,
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
