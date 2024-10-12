import 'package:flutter/material.dart';
import '../../../core/constants/AppColors.dart';

class UserPasswordField extends StatefulWidget {
  const UserPasswordField(
      {required this.oldPasswordController,
      required this.newPasswordController,
      super.key});
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  @override
  State<UserPasswordField> createState() => _UserPasswordFieldState();
}

class _UserPasswordFieldState extends State<UserPasswordField> {
  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;

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
            controller: widget.oldPasswordController,
            obscureText: !oldPasswordVisible,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    oldPasswordVisible = !oldPasswordVisible;
                  });
                },
                icon: Icon(
                  oldPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              hintText: 'Старый пароль',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey2),
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
        const SizedBox(height: 20),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            obscureText: !newPasswordVisible,
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: widget.newPasswordController,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    oldPasswordVisible = !oldPasswordVisible;
                  });
                },
                icon: Icon(
                  oldPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              hintText: 'Новый пароль',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey2),
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
      ],
    );
  }

 
}
