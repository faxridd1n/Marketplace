import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/screens/auth/auth_otp_page.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_birthday_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_number_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_passport_type_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_password_field.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_user_name_field.dart';
import '../../core/constants/app_colors.dart';
import '../../models/register_model/register_model/register_user_request_model.dart';
import 'widgets/auth_passport_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final userModel = RegisterUserRequestModel();
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.transparent,
          elevation: 2,
          shadowColor: AppColors.appBarShadowColor,
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
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
                  const SizedBox(height: 20),
                  AuthNumberField(userModel: userModel),
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

  Widget _buildSubmitButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registerUserResponseStatus == FormzSubmissionStatus.success) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).successful),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return
                    //  Pagee(
                    //   // model: userModel,
                    //   userResponseModel: state.registerUserResponseModel,
                    // );
                    BlocProvider(
                  create: (ctx) => AuthBloc(),
                  child: AuthOtpPage(
                    responseModel: state.registerUserResponseModel!,
                  ),
                );
              },
            ),
          );
        } else if (state.registerUserResponseStatus ==
            FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).failed),
            ),
          );
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formGlobalKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            RegisterUserEvent(
                                registerUserRequestModel: userModel),
                          );
                    }

                    // if (state.registerUserResponseStatus.isSuccess) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return
                    //           Pagee(
                    //             model: userModel,
                    //             // userResponseModel: state.registerUserResponseModel,
                    //           );
                    //       //     AuthOtpPage(
                    //       //   responseModel: state.registerUserResponseModel!,
                    //       // );
                    //     },
                    //   ),
                    // );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    // padding: EdgeInsets.symmetric(vertical: state.registerUserResponseStatus.isInProgress? 12:18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.grey2,
                  ),
                  child: state.registerUserResponseStatus.isInProgress
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: AppColors.white,
                          ),
                        )
                      : const Text(
                          'Сохранить',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
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
