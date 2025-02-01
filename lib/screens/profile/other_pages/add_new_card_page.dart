import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/request_models/post_user_add_card_request_model.dart';
import 'package:flutter_application_1/screens/profile/other_pages/user_add_card_otp_page.dart';
import 'package:flutter_application_1/screens/profile/widgets/new_card_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardMonthController = TextEditingController();
  TextEditingController cardYearController = TextEditingController();
  PostUserAddCardRequestModel requestModel = PostUserAddCardRequestModel();
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
          translation(context).addCard,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 40,
              ),
              child: Column(
                children: [
                  NewCardFields(
                    cardNameController: cardNameController,
                    cardNumberController: cardNumberController,
                    cardMonthController: cardMonthController,
                    cardYearController: cardYearController,
                    requestModel: requestModel,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: AppColors.pageBgColor,
                            ),
                            child: Text(
                              translation(context).cancel,
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BlocConsumer<UserCardsBloc, UserCardsState>(
                          listenWhen: (previous, current) =>
                              previous.postUserCardResponseStatus !=
                              current.postUserCardResponseStatus,
                          listener: (context, state) {
                            if (state.postUserCardResponseStatus ==
                                FormzSubmissionStatus.success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text(translation(context).successful),
                                ),
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserAddCardOtpPage(
                                    session: state.postUserCardResponseModel
                                        .result.session,
                                  ),
                                ),
                              );
                            } else if (state.postUserCardResponseStatus ==
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
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<UserCardsBloc>().add(
                                        PostUserCardResponseEvent(
                                          postUserAddCardRequestModel:
                                              PostUserAddCardRequestModel(
                                            cardName: cardNameController.text,
                                            cardNumber: cardNumberController
                                                .text
                                                .replaceAll(' ', ''),
                                            expire:
                                                '${cardMonthController.text}${cardYearController.text}',
                                            expireMonth:
                                                cardMonthController.text,
                                            expireYear: cardYearController.text,
                                          ),
                                        ),
                                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.green,
                                ),
                                child: state
                                        .postUserCardResponseStatus.isInProgress
                                    ? const SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          color: AppColors.white,
                                        ),
                                      )
                                    : Text(
                                        translation(context).addCard,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
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
    );
  }
}
