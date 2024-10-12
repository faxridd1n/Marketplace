import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/constants/AppColors.dart';

class ProfileNumberField extends StatefulWidget {
  const ProfileNumberField({required this.numberController, super.key});
  final TextEditingController numberController;
  @override
  State<ProfileNumberField> createState() => _ProfileNumberFieldState();
}

class _ProfileNumberFieldState extends State<ProfileNumberField> {
  // TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorWidth: 1.5,
      controller: widget.numberController,
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
