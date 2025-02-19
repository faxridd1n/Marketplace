import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login_model/post_login_request_model.dart';
import 'package:flutter_application_1/screens/auth/auth_page.dart';
import 'package:flutter_application_1/screens/forgot_password/forgot_password_page.dart';
import 'package:flutter_application_1/screens/login/login_bloc/login_bloc.dart';
import 'package:flutter_application_1/screens/login/privacy_policy_page.dart';
import 'package:flutter_application_1/screens/login/widgets/login_number_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../core/constants/app_colors.dart';
import '../../core/language/language_constants.dart';
import 'login_otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PostLoginRequestModel requestModel = PostLoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => LoginBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: AppColors.transparent,
          backgroundColor: AppColors.white,
          title: Text(
            translation(context).profile,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 2,
          shadowColor: AppColors.appBarShadowColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: AppColors.grey1,
                    radius: 40,
                    child: Center(
                      child: Icon(
                        Icons.person_rounded,
                        color: AppColors.grey2,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    translation(context).authorization,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    translation(context).weWillSendAVerificationCodeViaSMS,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
                // const SizedBox(height: 20),
                // ProfilePasswordField(
                //   userPasswordController: passwordController,
                // ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: Text(
                      translation(context).forgotYourPassword,
                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                _buildSubmitButton(),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => const AuthPage(),
                        ),
                      );
                    },
                    child: Text(
                      translation(context).register,
                      style: const TextStyle(
                        color: AppColors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: translation(context).byAuthorizingYouAgreeTo,
                    style: const TextStyle(color: AppColors.black),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => const PrivacyPolicyPage(),
                              ),
                            );
                          },
                        text: translation(context)
                            .thePersonalDataProcessingPolicy,
                        style: const TextStyle(
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(
                      color: AppColors.grey3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.postLoginUserResponseStatus ==
            FormzSubmissionStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  // Pagee(
                  //       number: requestModel.phoneNumber,
                  //     )
                  BlocProvider(
                create: (context) => LoginBloc(),
                child: LoginOtpPage(
                  phoneNumber: requestModel.phoneNumber!,
                ),
              ),
            ),
          );
        } else if (state.postLoginUserResponseStatus ==
            FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).failed),
            ),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: AppColors.green,
            ),
            onPressed: () {
              context.read<LoginBloc>().add(
                    PostLoginUserEvent(
                      phoneNumber: requestModel.phoneNumber!,
                    ),
                  );
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
                : Text(
                    translation(context).login,
                    style: const TextStyle(
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
