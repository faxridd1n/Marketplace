import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/components/hive/user_token_model.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/register_model/register_confirm_model/register_confirm_request_model.dart';
import 'package:flutter_application_1/models/register_model/register_model/register_user_response_model.dart';
import 'package:flutter_application_1/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/screens/auth/qwqwqw.dart';
import 'package:flutter_application_1/screens/auth/widgets/auth_otp_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
  void initState() {
    super.initState();
    requestModel.clientId = widget.responseModel.result!.clientId;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthBloc(),
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
                      'clientId:${requestModel.clientId}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        Expanded(child: _buildSubmitButton()),
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

  Widget _buildSubmitButton() {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registerConfirmResponseStatus ==
            FormzSubmissionStatus.success) {
          userTokenBox.put(
            'token',
            UserTokenModel(
              token:
                  state.registerConfirmResponseModel!.result.token.toString(),
            ),
          );
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          //   builder: (context) {
          //     return
          //         // const ProfilePage();
          //         Pagee(
          //       // userResponseModel: requestModel,
          //       registerConfirmRequestModel: requestModel,
          //       registerConfirmResponseModel:
          //           state.registerConfirmResponseModel,
          //     );
          //   },
          // ), (Route<dynamic> route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).successful),
            ),
          );
        } else if (state.registerConfirmResponseStatus ==
            FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(translation(context).failed),
            ),
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(
                  RegisterConfirmRequestEvent(
                    confirmRequestModel: requestModel,
                  ),
                );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppColors.green,
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
                  'Подтвердить',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        );
      },
    );
  }
}
