import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/app_colors.dart';
import '../components/hive/user_token_model.dart';
import '../screens/login/login_bloc/login_bloc.dart';
import '../screens/login/widgets/login_otp_widget.dart';

loginOtpDiolog(BuildContext context, Function() setState, String phoneNumber) {
  TextEditingController otpController = TextEditingController();

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
                  fontSize: 16,
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
            LoginOtpWidget(otpController: otpController),
            const SizedBox(height: 20),
            Row(
              children: [
                BlocProvider(
                  create: (ctx) => LoginBloc(),
                  child: Expanded(
                    child: buildSubmitButton(phoneNumber, otpController),
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
    String phoneNumber, TextEditingController otpController) {
  return BlocConsumer<LoginBloc, LoginState>(
    listener: (context, state) {
      if (state.putLoginResponseStatus == FormzSubmissionStatus.success) {
        context.read<UserAuthBloc>().add(AuthLoginRequested());
        userTokenBox.put(
          'token',
          UserTokenModel(
            token: state.putLoginOtpResponseModel!.result.token.toString(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful'),
          ),
        );
        Navigator.pop(context);
      } else if (state.putLoginResponseStatus ==
          FormzSubmissionStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration failed'),
          ),
        );
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (ctx) => Pagee(
        //             putLoginOtpResponseModel: state.putLoginOtpResponseModel,
        //           )
        //       //     LoginOtpPage(
        //       //   phoneNumber: numberController.text,
        //       // ),
        //       ),
        // );
      }
    },
    builder: (context, state) {
      return SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.read<LoginBloc>().add(
                  PutLoginOtpEvent(
                    phoneNumber: phoneNumber,
                    otp: otpController.text,
                  ),
                );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.green,
          ),
          child: state.putLoginResponseStatus.isInProgress
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
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      );
    },
  );
}
