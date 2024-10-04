import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_number_field.dart';
import 'package:flutter_application_1/screens/profile/widgets/profile_otp_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/AppColors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: 2,
            shadowColor: const Color.fromARGB(72, 0, 0, 0),
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
                              cursorWidth: 1.5,
                              readOnly: true,
                              decoration: const InputDecoration(
                                hintText: '+998 ',
                                hintStyle: TextStyle(
                                  color: Colors.black,
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
                        ProfileNumberField(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileOtpField(),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
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
                          color: Colors.white,
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
                      onTap: () {},
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'v1.0.0',
                        style: TextStyle(
                          color: AppColors.grey3,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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
