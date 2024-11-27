import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_request_model.dart';

import '../../../core/constants/app_colors.dart';

class AuthUserNameField extends StatefulWidget {
  const AuthUserNameField({required this.userModel, super.key});
  final RegisterUserRequestModel userModel;
  @override
  State<AuthUserNameField> createState() => _AuthUserNameFieldState();
}

class _AuthUserNameFieldState extends State<AuthUserNameField> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController middleName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Имя',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              widget.userModel.firstname = firstName.text;
              setState(() {});
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: firstName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Фамилия',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              widget.userModel.lastname = lastName.text;
              setState(() {});
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: lastName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Отчество',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              widget.userModel.middlename = middleName.text;
              setState(() {});
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: middleName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
      ],
    );
  }
}
