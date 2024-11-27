import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login_model/post_login_request_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constants/app_colors.dart';

class ProfileNumberField extends StatefulWidget {
  const ProfileNumberField({required this.requestModel, super.key});
  final PostLoginRequestModel requestModel;
  @override
  State<ProfileNumberField> createState() => _ProfileNumberFieldState();
}

class _ProfileNumberFieldState extends State<ProfileNumberField> {
  TextEditingController numberController = TextEditingController();
  String number = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {
        if (value.length == 12) {
          number += '998';
          var a = value.split('');
          for (var e in a) {
            if (e != ' ') number += e;
            widget.requestModel.phoneNumber = number;
            setState(() {});
          }
        }
      },
      cursorWidth: 1.5,
      controller: numberController,
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
    );
  }
}
