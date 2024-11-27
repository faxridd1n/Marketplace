import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/register_model/register_model/register_user_request_model.dart';

class AuthNumberField extends StatefulWidget {
  const AuthNumberField({required this.userModel, super.key});
  final RegisterUserRequestModel userModel;
  @override
  State<AuthNumberField> createState() => _AuthNumberFieldState();
}

class _AuthNumberFieldState extends State<AuthNumberField> {
  String number = '';

  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Номер телефона',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            // color: AppColors.grey1,
            border: Border.all(
              color: AppColors.grey3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: Center(
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    cursorWidth: 1.5,
                    readOnly: true,
                    decoration: const InputDecoration(
                      hintText: '+998 ',
                      hintStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: numberController,
                  onChanged: (value) {
                    if (value.length == 12) {
                      number+='998';
                      var a = value.split('');
                      for (var e in a) {
                        if (e != ' ') number += e;
                      }
                      widget.userModel.phoneNumber = number;
                    }
                  },

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your number correctly';
                    }
                    return null;
                  },
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  cursorWidth: 1.5,
                  // focusNode: focusNode,
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: "## ### ## ##",
                      filter: {"#": RegExp(r'[0-9]')},
                    )
                  ],
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    wordSpacing: 0,
                    letterSpacing: 0,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  cursorColor: AppColors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
