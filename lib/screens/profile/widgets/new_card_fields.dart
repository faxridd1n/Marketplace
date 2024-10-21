import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/constants/app_colors.dart';

class NewCardFields extends StatefulWidget {
  const NewCardFields(
      {required this.cardNameController,
      required this.cardNumberController,
      required this.cardMonthController,
      required this.cardYearController,
      super.key});
  final TextEditingController cardNameController;
  final TextEditingController cardNumberController;
  final TextEditingController cardMonthController;
  final TextEditingController cardYearController;
  @override
  State<NewCardFields> createState() => _NewCardFieldsState();
}

class _NewCardFieldsState extends State<NewCardFields> {
  TextEditingController oldNumberController = TextEditingController();
  TextEditingController newNumberController = TextEditingController();
  final FocusNode firstFieldFocusNode = FocusNode();
  final FocusNode secondFieldFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    oldNumberController.dispose();
    newNumberController.dispose();
    firstFieldFocusNode.dispose();
    secondFieldFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
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
              hintText: 'Название карты',
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
        const SizedBox(height: 15),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorWidth: 1.5,
            keyboardType: TextInputType.number,
            controller: widget.cardNumberController,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: "#### #### #### ####",
                filter: {"#": RegExp(r'[0-9]')},
              )
            ],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              hintText: 'Номер карты',
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
        const SizedBox(height: 15),
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
