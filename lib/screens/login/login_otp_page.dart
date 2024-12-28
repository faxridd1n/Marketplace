import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/login/login_bloc/login_bloc.dart';
import 'package:flutter_application_1/screens/login/widgets/login_otp_widget.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_event.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({required this.phoneNumber, super.key});
  final String phoneNumber;
  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          surfaceTintColor: AppColors.transparent,
          backgroundColor: AppColors.white,
          elevation: 2,
          shadowColor: AppColors.appBarShadowColor,
          centerTitle: true,
          title: const Text(
            'Смс с кодом',
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
                    LoginOtpWidget(otpController: otpController),
                    const SizedBox(height: 20),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.putLoginResponseStatus == FormzSubmissionStatus.success) {
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
          context.read<AuthenticationBloc>().add(const AuthenticationStatusChanged(AuthStatus.authenticated));
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
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.read<LoginBloc>().add(
                    PutLoginOtpEvent(
                      phoneNumber: widget.phoneNumber,
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
                    'Подтвердить',
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
}
