import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/auth_page.dart';
import 'package:flutter_application_1/screens/forgot_password_page/forgot_password_page.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_number_field.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_otp_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController numberController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => ProfileBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor:AppColors.white,
          appBar: AppBar(
            centerTitle: true,
            surfaceTintColor:AppColors.transparent,
            backgroundColor:AppColors.white,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 2,
            shadowColor: AppColors.appBarShadowColor
            ,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Авторизация',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
                                  color:AppColors.black,
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
                            numberController: numberController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProfilePasswordField(),
                  const SizedBox(
                    height: 15,
                  ),
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
                      child: const Text(
                        'Забыли пароль?',
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundColor: AppColors.green,
                      ),
                      onPressed: () {
                        // var number = numberController.text.replaceAll(' ', '');
                        // if (number.length == 9) {
                        //   context.read<ProfileBloc>().add(
                        //         PostAuthUser(phoneNumber: '998${number}'),
                        //       );
                        //   _passwordVisible = !_passwordVisible;
                        //   setState(() {});
                        // }
                      },
                      child: const Text(
                        'Войти',
                        style: TextStyle(
                          color:AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
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
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topCenter,
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
        );
      }),
    );
  }
}
