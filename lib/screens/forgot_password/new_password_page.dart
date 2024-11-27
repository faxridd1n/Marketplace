import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/forgot_password/widgets/new_password_field.dart';

import '../../core/constants/app_colors.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.white,
      appBar: AppBar(
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor
        ,
        backgroundColor:AppColors.white,
        surfaceTintColor:AppColors.transparent,
        centerTitle: true,
        title: const Text(
          'Новый пароль',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey2, width: 0.5),
          ),
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: MediaQuery.of(context).size.height * 0.25,
            bottom: 50
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: [
              const NewPasswordField(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Подтвердить',
                        style: TextStyle(
                          color:AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
