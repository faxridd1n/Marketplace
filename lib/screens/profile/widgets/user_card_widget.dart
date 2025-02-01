import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/get_user_cards_response_model.dart';
import 'package:flutter_application_1/screens/profile/profile_bloc/user_cards_page_bloc/user_cards_bloc.dart';
import 'package:flutter_application_1/screens/profile/widgets/delete_card_diolog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({required this.cardItem, super.key});
  final Item cardItem;

  @override
  State<UserCardWidget> createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final userCardsBloc = context.read<UserCardsBloc>();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.green,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cardItem.bankName,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.uzcard,
                      height: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Text(
                widget.cardItem.ownerName,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.cardItem.cardNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${widget.cardItem.expireDate.substring(2)}/${widget.cardItem.expireDate.substring(0, 2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    userCardsBloc
                        .add(PutUserMainCardEvent(cardId: widget.cardItem.id));
                  },
                  child: Icon(
                    widget.cardItem.isMainCard
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color:
                        widget.cardItem.isMainCard ? Colors.green : Colors.grey,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  translation(context).mainCard,
                  style: TextStyle(
                    fontSize: 16,
                    color:
                        isChecked == true ? AppColors.black : AppColors.grey2,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                deleteCardDialog(
                  context,
                  () {
                    setState(() {});
                  },
                  widget.cardItem,
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    translation(context).delete,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
