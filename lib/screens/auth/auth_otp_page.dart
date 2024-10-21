import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_model/register_user_response_model.dart';
import 'package:flutter_application_1/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_otp_field.dart';
import 'package:flutter_application_1/screens/profile/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
// import 'qwqwqw.dart';

class AuthOtpPage extends StatefulWidget {
  const AuthOtpPage({required this.responseModel, super.key});
  // final RegisterUserModel userModel;
  final RegisterUserResponseModel responseModel;
  @override
  State<AuthOtpPage> createState() => _AuthOtpPageState();
}

class _AuthOtpPageState extends State<AuthOtpPage> {
  TextEditingController otpController = TextEditingController();

  RegisterConfirmRequestModel requestModel = RegisterConfirmRequestModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
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
                    Text(
                      widget.responseModel.result!.otpSentPhone,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AuthOtpField(
                      otpController: otpController,
                      userModel: requestModel,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state.registerUserResponseStatus ==
                                  FormzSubmissionStatus.success) {
                                // Show success message
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ProfilePage();
                                      // return Pagee(
                                      //   userResponseModel: requestModel,
                                      //   requestModel: requestModel,
                                      // );
                                    },
                                  ),
                                  (Route<dynamic> route) =>
                                      false, // This removes all previous routes
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registration successful'),
                                  ),
                                );
                              } else if (state.registerUserResponseStatus ==
                                  FormzSubmissionStatus.failure) {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Registration failed'),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {
                                  requestModel.clientId =
                                      widget.responseModel.result!.clientId;

                                  context.read<AuthBloc>().add(
                                        RegisterConfirmRequestEvent(
                                          userModel: requestModel,
                                        ),
                                      );
                                  setState(() {
                                    userTokenBox.putAt(
                                      0,
                                      UserTokenModel(
                                        token: state
                                            .registerConfirmResponseModel!
                                            .result!
                                            .token
                                            .toString(),
                                      ),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
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
                              );
                            },
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
      ),
    );
  }
}
