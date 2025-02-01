import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../buy_now_bloc/buy_now_bloc.dart';

class InputAddressWidget extends StatefulWidget {
  const InputAddressWidget({super.key});
  @override
  State<InputAddressWidget> createState() => _InputAddressWidgetState();
}

class _InputAddressWidgetState extends State<InputAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {
          context.read<BuyNowBloc>().add(FillCommentEvent(
                comment: value,
              ));
        });
      },
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorWidth: 1.5,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 5,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintText: translation(context).enterHere,
        hintStyle: const TextStyle(
          color: AppColors.grey2,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: AppColors.grey1,
      ),
      cursorColor: AppColors.green,
    );
  }
}
