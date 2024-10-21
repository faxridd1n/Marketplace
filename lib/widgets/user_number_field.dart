import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../core/constants/app_colors.dart';

class UserNumberField extends StatefulWidget {
  const UserNumberField({required this.textController, super.key});
  final TextEditingController textController;
  @override
  State<UserNumberField> createState() => _UserNumberFieldState();
}

class _UserNumberFieldState extends State<UserNumberField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.grey1,
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
                    color:AppColors.black,
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
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              cursorWidth: 1.5,
              controller: widget.textController,
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
    );
  }
}
