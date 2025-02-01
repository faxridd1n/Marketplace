import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/user_number_field.dart';

import '../../../../core/constants/app_colors.dart';

class EditNumberPage extends StatefulWidget {
  const EditNumberPage({super.key});

  @override
  State<EditNumberPage> createState() => _EditNumberPageState();
}

class _EditNumberPageState extends State<EditNumberPage> {
  TextEditingController oldNumberController = TextEditingController();
  TextEditingController newNumberController = TextEditingController();

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
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Текущий номер телефона',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  UserNumberField(textController: oldNumberController),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Новый номер телефона',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  UserNumberField(textController: newNumberController),
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
}
