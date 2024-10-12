import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/AppColors.dart';
import '../../../models/auth_model/register_user_request_model.dart';

class AuthPassportField extends StatefulWidget {
  const AuthPassportField({required this.userModel, super.key});
  final RegisterUserModel userModel;
  @override
  State<AuthPassportField> createState() => _AuthPassportFieldState();
}

class _AuthPassportFieldState extends State<AuthPassportField> {
  TextEditingController passportSerialController = TextEditingController();
  TextEditingController passportNumberController = TextEditingController();
  final FocusNode firstFieldFocusNode = FocusNode();
  final FocusNode secondFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    passportSerialController.dispose();
    passportNumberController.dispose();
    passportNumberController.dispose();
    firstFieldFocusNode.dispose();
    secondFieldFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Серия и номер паспорта',
          style: TextStyle(
            color: AppColors.grey2,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 60,
              child: TextFormField(
                focusNode: firstFieldFocusNode,
                controller: passportSerialController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(2),
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  UpperCaseTextFormatter(),
                ],
                onChanged: (value) {
                  if (value.length == 2) {
                    FocusScope.of(context).nextFocus();
                    widget.userModel.passportSerial =
                        passportSerialController.text;
                    setState(() {});
                  }
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorWidth: 1.5,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  wordSpacing: 0,
                  letterSpacing: 0,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                ),
                cursorColor: AppColors.green,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                focusNode: secondFieldFocusNode,
                controller: passportNumberController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                onChanged: (value) {
                  if (value.isEmpty) {
                    FocusScope.of(context).previousFocus();
                  } else if (value.length == 7) {
                    widget.userModel.passportNumber =
                        passportNumberController.text;
                    setState(() {});
                  }
                },
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorWidth: 1.5,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  wordSpacing: 0,
                  letterSpacing: 0,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                ),
                cursorColor: AppColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
