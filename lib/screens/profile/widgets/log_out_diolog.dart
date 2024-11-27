import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
// import 'package:flutter_application_1/screens/login/login_page.dart';

import '../../../core/constants/app_colors.dart';

logOutDiolog(BuildContext context, Function() setState) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Вы уверены что хотите выйти?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: AppColors.green),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Отмена',
                      style: TextStyle(
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      userTokenBox.delete('token');
                      setState();
                      Navigator.pop(context);
                      // Navigator.of(context, rootNavigator: true)
                      //     .pushAndRemoveUntil(
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginPage(),
                      //   ),
                      //   (Route<dynamic> route) => false,
                      // );
                    },
                    child: const Text(
                      'Да, выйти',
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
