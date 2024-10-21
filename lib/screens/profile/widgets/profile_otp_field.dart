import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ProfilePasswordField extends StatefulWidget {
  const ProfilePasswordField({super.key});

  @override
  State<ProfilePasswordField> createState() => _ProfilePasswordFieldState();
}

class _ProfilePasswordFieldState extends State<ProfilePasswordField> {
  bool _passwordVisible = false;

  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 60,
        child: TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
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
            hintText: 'Пароль',
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grey2,
            ),
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
            filled: true,
            fillColor: AppColors.grey1,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: AppColors.green,
        ),
      ),
    );
  }
 @override
  void dispose() {
    super.dispose();
    userPasswordController.dispose();
  }
}
