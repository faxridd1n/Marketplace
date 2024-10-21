import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/auth_model/register_confirm_model/register_confirm_request_model.dart';

import '../../../core/constants/app_colors.dart';
import '../../forgot_password_page/widgets/otp_timer.dart';

class AuthOtpField extends StatefulWidget {
  const AuthOtpField(
      {required this.otpController, required this.userModel, super.key});
  final TextEditingController otpController;
  final RegisterConfirmRequestModel userModel;
  @override
  State<AuthOtpField> createState() => _AuthOtpFieldState();
}

class _AuthOtpFieldState extends State<AuthOtpField>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  int otpTimer = 180;

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: otpTimer));

    _controller!.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 6) {
            widget.otpController.text = value;
            widget.userModel.otp = value;
          }
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        cursorWidth: 1.5,
        keyboardType: TextInputType.number,
        controller: widget.otpController,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey1,
          hintText: 'Код смс',
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grey2,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Countdown(
              animation: StepTween(
                begin: otpTimer, // THIS IS A USER ENTERED NUMBER
                end: 0,
              ).animate(_controller!),
            ),
          ),
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
    );
  }
}
