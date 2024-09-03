import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class HomePopUpMenuWidget extends StatefulWidget {
  bool isLanguagePopUp;
  String icon;

  HomePopUpMenuWidget(this.isLanguagePopUp, this.icon, {super.key});

  @override
  State<HomePopUpMenuWidget> createState() => _HomePopUpMenuWidgetState();
}

class _HomePopUpMenuWidgetState extends State<HomePopUpMenuWidget> {
  String selectedItem = '';
  bool popUpIsOpen = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
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
      initialValue: selectedItem.length < 1
          ? widget.isLanguagePopUp
              ? 'O\'zbekcha'
              : 'Toshkent shahri'
          : selectedItem,
      icon: popUpIsOpen
          ? Row(
              children: [
                SvgPicture.asset(widget.icon),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  selectedItem.length < 1
                      ? widget.isLanguagePopUp
                          ? 'O\'zbekcha'
                          : 'Toshkent shahri'
                      : selectedItem,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.keyboard_arrow_up,
                )
              ],
            )
          : Row(
              children: [
                SvgPicture.asset(widget.icon),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  selectedItem.length < 1
                      ? widget.isLanguagePopUp
                          ? 'O\'zbekcha'
                          : 'Toshkent shahri'
                      : selectedItem,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                )
              ],
            ),
      itemBuilder: (BuildContext context) {
        return widget.isLanguagePopUp
            ? {
                'O\'zbekcha',
                'English',
                'Русский',
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList()
            : {
                'Toshkent shahri',
                'Qoraqalpog\'iston Respublikasi',
                'Andijon viloyati',
                'Buxoro viloyati',
                'Jizzax viloyati',
                'Qashqadaryo viloyati',
                'Navoiy viloyati',
                'Namangan viloyati',
                'Samarqand viloyati',
                'Surxandaryo viloyati',
                'Sirdaryo viloyati',
                'Toshkent viloyati',
                'Xorazm viloyati',
                'Farg\'ona viloyati',
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
