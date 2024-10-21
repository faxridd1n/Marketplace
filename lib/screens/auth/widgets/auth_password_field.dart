import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth_model/register_model/register_user_request_model.dart';

import '../../../core/constants/app_colors.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({required this.userModel, super.key});
  final RegisterUserModel userModel;
  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _passwordVisible = false;

  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userRetryPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Пароль',
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
              widget.userModel.password = userPasswordController.text;
              setState(() {});
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: userPasswordController,
            obscureText: !_passwordVisible,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3),
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
        SizedBox(height: 20),
        const Text(
          'Подтвердите пароль',
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
              widget.userModel.confirmPassword = userRetryPasswordController.text;
              setState(() {});
            },
            obscureText: !_passwordVisible,
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: userRetryPasswordController,
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

  @override
  void dispose() {
    super.dispose();
    userPasswordController.dispose();
    userRetryPasswordController.dispose();
  }
}
