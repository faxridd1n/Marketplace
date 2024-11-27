import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_colors.dart';
import '../../forgot_password/widgets/otp_timer.dart';

class LoginOtpWidget extends StatefulWidget {
  const LoginOtpWidget(
      {required this.otpController, super.key});
  final TextEditingController otpController;
  @override
  State<LoginOtpWidget> createState() => _LoginOtpWidgetState();
}

class _LoginOtpWidgetState extends State<LoginOtpWidget>
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
          hintStyle: const TextStyle(
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
