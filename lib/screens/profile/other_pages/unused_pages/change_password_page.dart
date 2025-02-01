import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/widgets/user_password_field.dart';

import '../../../../core/constants/app_colors.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        centerTitle: true,
        title: const Text(
          'Изменить номер',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey2, width: 0.5),
              ),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                children: [
                  UserPasswordField(
                    oldPasswordController: oldPasswordController,
                    newPasswordController: newPasswordController,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return const ProfilePage();
                            //       // Pagee(
                            //       //   // model: widget.userModel,
                            //       //   // userResponseModel:requestModel,
                            //       //   requestModel: requestModel,
                            //       // );
                            //     },
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.green,
                          ),
                          child: const Text(
                            'Подтвердить',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
  }
}
