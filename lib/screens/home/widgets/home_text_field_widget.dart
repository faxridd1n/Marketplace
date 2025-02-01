import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets_path/app_icons_path.dart';
import '../../../core/constants/app_colors.dart';

class HomeTextFieldWidget extends StatefulWidget {
  const HomeTextFieldWidget({super.key});

  @override
  State<HomeTextFieldWidget> createState() => _HomeTextFieldWidgetState();
}

class _HomeTextFieldWidgetState extends State<HomeTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(62, 0, 0, 0),
              blurRadius: 4,
            ),
          ]),
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextFormField(
        cursorWidth: 1.5,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: translation(context).searchProduct,
          hintStyle: const TextStyle(
            color: AppColors.grey3,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColors.white,
          prefixIcon: SvgPicture.asset(
            AppIcons.search,
            width: 22,
            height: 22,
            fit: BoxFit.scaleDown,
          ),
        ),
        cursorColor: AppColors.green,
      ),
    );
  }
}
