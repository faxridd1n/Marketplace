import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/auth_model/register_model/register_user_request_model.dart';

class AuthPassportTypeField extends StatefulWidget {
  const AuthPassportTypeField({required this.userModel, super.key});
  final RegisterUserModel userModel;
  @override
  State<AuthPassportTypeField> createState() => _AuthPassportTypeFieldState();
}

class _AuthPassportTypeFieldState extends State<AuthPassportTypeField> {
  List<String> regions = [
    'Паспорт',
    'ID карта',
  ];
  String selectedRegion = '';
  bool popUpIsOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Тип документа',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        PopupMenuButton(
          surfaceTintColor: AppColors.transparent,
          shadowColor: AppColors.black,
          splashRadius: 5,
          color: AppColors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          offset: const Offset(0, 70),
          onSelected: (value) {
            value.toString() == 'ID'
                ? widget.userModel.passportType = 2
                : widget.userModel.passportType = 1;
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
          icon: SizedBox(
            height: 60,
            width: screenWidth,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedRegion.isEmpty ? '' : selectedRegion,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    popUpIsOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ],
              ),
            ),
          ),
          itemBuilder: (BuildContext context) {
            return regions.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: SizedBox(width: screenWidth - 40, child: Text(choice)),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
