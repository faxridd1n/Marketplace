import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/AppIconsPath.dart';
import '../../../core/constants/AppColors.dart';

class HomeTextFieldWidget extends StatefulWidget {
  const HomeTextFieldWidget({super.key});

  @override
  State<HomeTextFieldWidget> createState() => _HomeTextFieldWidgetState();
}

class _HomeTextFieldWidgetState extends State<HomeTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.grey3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.grey3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          hintText: 'Mahsulot qidirish...',
          hintStyle: const TextStyle(
            color: AppColors.grey2,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.grey1,
          prefixIcon: SvgPicture.asset(
            AppIcons.search,
            width: 22,
            height: 22,
            fit: BoxFit.scaleDown,
          ),
        ),
        cursorColor: AppColors.primaryColor,
      ),
    );
  }
}
