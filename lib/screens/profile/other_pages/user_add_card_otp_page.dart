import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/login/widgets/login_otp_widget.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class UserAddCardOtpPage extends StatefulWidget {
  const UserAddCardOtpPage({required this.session, super.key});
  final int session;
  @override
  State<UserAddCardOtpPage> createState() => _UserAddCardOtpPageState();
}

class _UserAddCardOtpPageState extends State<UserAddCardOtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final userCardsBloc = context.read<UserCardsBloc>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        centerTitle: true,
        title: Text(
          translation(context).smsWithCode,
          style: const TextStyle(
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
                  BlocConsumer<UserCardsBloc, UserCardsState>(
                    listenWhen: (previous, current) =>
                        previous.postUserAddCardConfirmResponsStatus !=
                        current.postUserAddCardConfirmResponsStatus,
                    listener: (context, state) {
                      if (state.postUserAddCardConfirmResponsStatus ==
                          FormzSubmissionStatus.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(translation(context).successful),
                          ),
                        );

                        Navigator.pop(context);
                      } else if (state.postUserAddCardConfirmResponsStatus ==
                          FormzSubmissionStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(translation(context).failed),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserCardsBloc>().add(
                                  PostUserAddCardConfirmResponseEvent(
                                    otp: otpController.text,
                                    session: widget.session,
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
                          child: state.postUserAddCardConfirmResponsStatus
                                  .isInProgress
                              ? const SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: AppColors.white,
                                  ),
                                )
                              : Text(
                                  translation(context).confirm,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
