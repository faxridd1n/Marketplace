import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth_model/register_user_request_model.dart';
import 'package:flutter_application_1/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/screens/auth/auth_otp_page.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_birthday_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_passport_type_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_password_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_user_name_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../core/constants/AppColors.dart';
import 'widgets/auth_passport_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final userModel = RegisterUserModel();
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: const Color.fromARGB(100, 0, 0, 0),
          centerTitle: true,
          title: const Text(
            'Регистрация',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: _formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Личные данные',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AuthUserNameField(userModel: userModel),
                  _buildPhoneNumberField(),
                  const SizedBox(height: 20),
                  AuthBirthdayField(userModel: userModel),
                  const SizedBox(height: 20),
                  AuthPassportTypeField(userModel: userModel),
                  const SizedBox(height: 20),
                  AuthPassportField(userModel: userModel),
                  const SizedBox(height: 20),
                  AuthPasswordField(userModel: userModel),
                  const SizedBox(height: 20),
                  _buildSubmitButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    String number = '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Номер телефона',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            
            controller: numberController,
            onChanged: (value) {
              if (value.length == 17) {
                var a = value.split('');
                for (var e in a) {
                  if (e != '+' && e != ' ') number += e;
                }
                userModel.phoneNumber = number;
              }
            },
            inputFormatters: [
              MaskTextInputFormatter(
                mask: "+### ## ### ## ##",
                filter: {"#": RegExp(r'[0-9]')},
              )
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your number correctly';
              }
              return null;
            },
            keyboardType: TextInputType.number,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.grey3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.grey3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.grey3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (_formGlobalKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          RegisterUserEvent(userModel: userModel),
                        );
                  }

                  if (state.registerUserResponseStatus.isSuccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return
                              // Pagee(
                              //   // model: userModel,
                              //   userResponseModel: state.registerUserResponseModel,
                              // );
                              AuthOtpPage(
                            // userModel: userModel,
                            responseModel: state.registerUserResponseModel,
                          );
                        },
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.grey2,
                ),
                child: state.registerUserResponseStatus.isInProgress
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      )
                    : const Text(
                        'Сохранить',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
