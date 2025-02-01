import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/models/profile_model/user_cards/request_models/post_user_add_card_request_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/constants/app_colors.dart';

class NewCardFields extends StatefulWidget {
  const NewCardFields(
      {required this.cardNameController,
      required this.cardNumberController,
      required this.cardMonthController,
      required this.cardYearController,
      required this.requestModel,
      super.key});
  final TextEditingController cardNameController;
  final TextEditingController cardNumberController;
  final TextEditingController cardMonthController;
  final TextEditingController cardYearController;
  final PostUserAddCardRequestModel requestModel;
  @override
  State<NewCardFields> createState() => _NewCardFieldsState();
}

class _NewCardFieldsState extends State<NewCardFields> {
  int cardType = -1;
  List cardIcons = [
    AppIcons.humo,
    AppIcons.uzcard,
  ];
  // final TextEditingController cardNumberController = TextEditingController();
  final MaskTextInputFormatter cardNumberFormatter = MaskTextInputFormatter(
    mask: "XXXX XXXX XXXX XXXX",
    filter: {"X": RegExp(r'[0-9]')},
  );

  void _updateCardType(String value) {
    if (value.length >= 4) {
      final firstFourDigits = value.substring(0, 4);
      int newCardType = -1;

      if (firstFourDigits == '9860') {
        newCardType = 0; // Humo
      } else if (firstFourDigits == '8600' || firstFourDigits == '8601') {
        newCardType = 1; // Uzcard
      }

      if (newCardType != cardType) {
        setState(() {
          cardType = newCardType;
        });
      }
    }
    if (value.length == 19) {
      final v1 = value.split('');
      String result = '';
      for (var e in v1) {
        if (e != ' ') {
          result += e;
        }
      }
      widget.requestModel.cardNumber != result;
    } else {
      setState(() {
        cardType = -1; // Reset icon if input is less than 4 digits
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Cardholder's Full Name",
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 50,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: widget.cardNameController,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              hintText: 'Full Name',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey2),
              filled: true,
              fillColor: AppColors.grey1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Card Number",
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 50,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: _updateCardType,
            cursorWidth: 1.5,
            keyboardType: TextInputType.number,
            controller: widget.cardNumberController,
            inputFormatters: [
              cardNumberFormatter,
            ],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  AppIcons.wallet,
                  color: AppColors.grey2,
                ),
              ),
              suffixIcon: cardType != -1
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        cardIcons[cardType],
                      ),
                    )
                  : null,
              hintText: 'XXXX XXXX XXXX XXXX',
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.grey2),
              filled: true,
              fillColor: AppColors.grey1,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Expiration Date",
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  if (value.length == 2) {
                    FocusScope.of(context).nextFocus();
                    setState(() {});
                  }
                },
                cursorWidth: 1.5,
                keyboardType: TextInputType.number,
                controller: widget.cardMonthController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'ММ',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.grey2),
                  filled: true,
                  fillColor: AppColors.grey1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorColor: AppColors.green,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 60,
              child: TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    FocusScope.of(context).previousFocus();
                  } else if (value.length == 7) {
                    setState(() {});
                  }
                },
                cursorWidth: 1.5,
                keyboardType: TextInputType.number,
                controller: widget.cardYearController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'ГГ',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.grey2),
                  filled: true,
                  fillColor: AppColors.grey1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                cursorColor: AppColors.green,
              ),
            ),
          ],
        )
      ],
    );
  }
}
