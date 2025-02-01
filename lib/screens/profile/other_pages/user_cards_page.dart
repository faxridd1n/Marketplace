import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/screens/profile/other_pages/add_new_card_page.dart';
import 'package:flutter_application_1/screens/profile/other_pages/user_cards_empty_page.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';
import 'package:flutter_application_1/screens/profile/widgets/user_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/constants/app_colors.dart';
import '../../../widgets/indicator.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCardsBloc>().add(GetUserCardsResponseEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 2,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.appBarShadowColor,
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          translation(context).myCards,
        ),
      ),
      body: BlocBuilder<UserCardsBloc, UserCardsState>(
        builder: (context, state) {
          if (state.getUserCardsResponseStatus.isInProgress ||
              state.deleteUserCardResponseStatus.isInProgress ||
              state.postUserAddCardConfirmResponsStatus.isInProgress ||
              state.postUserCardResponseStatus.isInProgress) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomLoadingIndicator(),
              ),
            );
          }
          if (state.getUserCardsResponseStatus.isSuccess ||
              state.deleteUserCardResponseStatus.isSuccess ||
              state.postUserAddCardConfirmResponsStatus.isSuccess ||
              state.postUserCardResponseStatus.isSuccess) {
            if (state.getUserCardsResponseModel.result.allCount == 0) {
              return const UserCardsEmptyPage();
            }
    
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: context.read<UserCardsBloc>(),
                            child: const AddNewCardPage(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 30,
                          color: AppColors.green,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          translation(context).addCard,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        state.getUserCardsResponseModel.result.allCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: BlocProvider.value(
                          value: context.read<UserCardsBloc>(),
                          child: UserCardWidget(
                            cardItem: state.getUserCardsResponseModel.result
                                .items[index],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          if (state.getUserCardsResponseStatus.isFailure ||
              state.deleteUserCardResponseStatus.isFailure ||
              state.postUserAddCardConfirmResponsStatus.isFailure ||
              state.postUserCardResponseStatus.isFailure) {
            return Center(
              child: Text(
                state.getUserCardsResponseModel.error.errorCode.toString(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
