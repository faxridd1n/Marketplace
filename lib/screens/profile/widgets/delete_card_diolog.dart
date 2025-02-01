import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/get_user_cards_response_model.dart';
// import 'package:flutter_application_1/screens/login/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';

deleteCardDialog(
    BuildContext parentContext, Function() setState, Item userCardModel) {
  return showDialog<String>(
    context: parentContext,
    builder: (BuildContext context) {
      final userCardsBloc = parentContext.read<UserCardsBloc>();
      return Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Haqiqatdan ham ${userCardModel.cardNumber} kartangizni o’chirb yubormoqchimisiz?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: AppColors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        userCardsBloc.add(
                          DeleteUserCardEvent(cardId: userCardModel.id),
                        );
                        Navigator.pop(context);
                      },
                      child: Text(
                        translation(context).yesDelete,
                        style: const TextStyle(
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        translation(context).noCancel,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
