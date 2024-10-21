import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/models/auth_model/register_model/register_user_request_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constants/app_colors.dart';

class AuthBirthdayField extends StatefulWidget {
  const AuthBirthdayField({required this.userModel, super.key});
  final RegisterUserModel userModel;
  @override
  State<AuthBirthdayField> createState() => _AuthBirthdayFieldState();
}

class _AuthBirthdayFieldState extends State<AuthBirthdayField> {
  TextEditingController dateController = TextEditingController();
  DateTime today = DateTime.now();
  TextEditingController birthdayController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? birthDay = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              indicatorColor: AppColors.green,
              datePickerTheme: DatePickerThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                weekdayStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color:AppColors.grey2,
                ),
                todayBorder: BorderSide.none,
                headerBackgroundColor: AppColors.green,
                headerForegroundColor:AppColors.white,
              ),
              colorScheme: const ColorScheme.light(
                primary: AppColors.green,
                onPrimary:AppColors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.green, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: today,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime.now());
    if (birthDay != null && birthDay != today) {
      setState(
        () {
          today = birthDay;
          widget.userModel.birthDate = birthDay.toString();
          birthdayController.text =
              '${birthDay.day < 10 ? 0 : ''}${birthDay.day}.${birthDay.month < 10 ? 0 : ''}${birthDay.month}.${birthDay.year}';
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Дата рождения',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            if (value.length >= 10) {
              widget.userModel.birthDate =
                  '${birthdayController.text.substring(6)}-${birthdayController.text.substring(3, 5)}-${birthdayController.text.substring(0, 2)} 00:00:00.000';
            }
          },
          cursorWidth: 1.5,
          controller: birthdayController,
          inputFormatters: [
            MaskTextInputFormatter(
              mask: "##.##.####",
              filter: {
                "#": RegExp(r'[0-9]'),
              },
            )
          ],
          keyboardType: TextInputType.number,
          style: const TextStyle(
            wordSpacing: 0,
            letterSpacing: 0,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: 'dd.mm.yyyy',
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.grey2,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: SvgPicture.asset(
                  AppIcons.calendar,
                  color: AppColors.grey2,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.grey3,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.grey3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.grey3,
              ),
            ),
          ),
          cursorColor: AppColors.green,
        ),
      ],
    );
  }
}
