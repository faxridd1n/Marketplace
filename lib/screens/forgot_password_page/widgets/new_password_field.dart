import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

class NewPasswordField extends StatefulWidget {
  const NewPasswordField({super.key});

  @override
  State<NewPasswordField> createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<NewPasswordField> {
  bool _passwordVisible = false;

  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userRetryPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
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
              hintText: 'Новый пароль',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey2,
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
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
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
              hintText: 'Подтвердите пароль',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.grey2,
              ),
              filled: true,
              fillColor: AppColors.grey1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
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
