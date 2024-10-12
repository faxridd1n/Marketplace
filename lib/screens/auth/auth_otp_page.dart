import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/auth_model/register_user_response_model.dart';
import 'package:flutter_application_1/screens/auth/auth_bloc/auth_bloc.dart';
// import 'package:flutter_application_1/screens/auth/qwqwqw.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_otp_field.dart';
import 'package:flutter_application_1/screens/profile/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthOtpPage extends StatefulWidget {
  const AuthOtpPage({required this.responseModel, super.key});
  // final RegisterUserModel userModel;
  final RegisterUserResponseModel? responseModel;
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 2,
          shadowColor: const Color.fromARGB(88, 0, 0, 0),
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
                      '+${widget.responseModel?.result?.otpSentPhone}',
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
                          child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {
                                  requestModel.clientId =
                                      widget.responseModel?.result?.clientId;

                                  context.read<AuthBloc>().add(
                                        RegisterConfirmRequestEvent(
                                          userModel: requestModel,
                                        ),
                                      );
                                  if (state.registerConfirmResponseModel?.result
                                          ?.token.isNotEmpty ??
                                      true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const ProfilePage();
                                          // Pagee(
                                          //   // model: widget.userModel,
                                          //   // userResponseModel:requestModel,
                                          //   requestModel: requestModel,
                                          // );
                                        },
                                      ),
                                    );
                                  }
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
                                    color: Colors.white,
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
