import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile_model/user_profile_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';

class UserInfoInputSection extends StatefulWidget {
  const UserInfoInputSection(
      {required this.nameController,
      required this.numberController,
      required this.userProfileModel,
      super.key});
  final UserProfileModel userProfileModel;
  final TextEditingController nameController;
  final TextEditingController numberController;
  @override
  State<UserInfoInputSection> createState() => _UserInfoInputSectionState();
}

class _UserInfoInputSectionState extends State<UserInfoInputSection> {
  final maskFormatter = MaskTextInputFormatter(
    mask: '+### ## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
    widget.nameController.text = '';
    widget.nameController.text +=
        '${widget.userProfileModel.result.firstName} ${widget.userProfileModel.result.lastName}';
    widget.numberController.text = maskFormatter.maskText(
      widget.userProfileModel.result.phoneNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translation(context).phoneNumber,
        ),
        const SizedBox(height: 10),
        Container(
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
              Expanded(
                child: TextFormField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    if (!value.startsWith("+")) {
                      widget.numberController.text = "+";
                    }
                    if (value.length == 12) {
                      var a = value.split('');
                      for (var e in a) {
                        if (e != ' ') widget.numberController.text += e;
                        setState(() {});
                      }
                    }
                  },
                  cursorWidth: 1.5,
                  controller: widget.numberController,
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
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
        const SizedBox(height: 20),
        Text(
          translation(context).firstName,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          child: TextFormField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {},
            cursorWidth: 1.5,
            keyboardType: TextInputType.text,
            controller: widget.nameController,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              filled: true,
              fillColor: AppColors.grey1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: AppColors.grey3, width: 0.5),
              ),
            ),
            cursorColor: AppColors.green,
          ),
        ),
      ],
    );
  }
}
