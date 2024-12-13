import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/widgets/login_otp_dialog.dart';
// import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/app_colors.dart';
import '../models/login_model/post_login_request_model.dart';
import '../screens/login/login_bloc/login_bloc.dart';
import '../screens/login/widgets/login_number_field.dart';

loginDiolog(BuildContext context, Function() setState) {
  PostLoginRequestModel requestModel = PostLoginRequestModel();
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Авторизация',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Номер телефона',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.grey1,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: Center(
                      child: TextFormField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        cursorWidth: 1.5,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: '+998 ',
                          hintStyle: TextStyle(
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ProfileNumberField(
                      requestModel: requestModel,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                BlocProvider(
                  create: (ctx) => LoginBloc(),
                  child: Expanded(
                    child: buildSubmitButton(requestModel, () {
                      setState();
                    }),
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

Widget buildSubmitButton(
    PostLoginRequestModel requestModel, Function() setState) {
  return BlocConsumer<LoginBloc, LoginState>(
    listener: (context, state) {
      if (state.postLoginUserResponseStatus == FormzSubmissionStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful'),
          ),
        );
        Navigator.pop(context);
        loginOtpDiolog(
          context,
          setState,
          requestModel.phoneNumber!,
        );
      } else if (state.postLoginUserResponseStatus ==
          FormzSubmissionStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration failed'),
          ),
        );
      }
    },
    builder: (context, state) {
      return SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            context.read<LoginBloc>().add(
                  PostLoginUserEvent(
                    phoneNumber: requestModel.phoneNumber!,
                  ),
                );
            userTokenBox.delete('token');
            setState();

            // Navigator.of(context, rootNavigator: true)
            //     .pushAndRemoveUntil(
            //   MaterialPageRoute(
            //     builder: (context) => const LoginPage(),
            //   ),
            //   (Route<dynamic> route) => false,
            // );
          },
          child: state.postLoginUserResponseStatus.isInProgress
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: AppColors.white,
                  ),
                )
              : const Text(
                  'Войти',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
        ),
      );
    },
  );
}
