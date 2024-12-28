import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.titleText,
    this.onSeaAllTap,
  });

  final String titleText;
  final VoidCallback? onSeaAllTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              titleText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 5),
          if (onSeaAllTap != null) ...{
            GestureDetector(
              onTap: onSeaAllTap,
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  bottom: 10,
                ),
                child:
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    // Text(
                    //   'Смотреть всё',
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //     color:AppColors.black,
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Icon(
                  Icons.arrow_forward,
                  color: AppColors.grey2,
                  size: 30,
                ),
              ),
            )
          }
        ],
      ),
    );
  }
}
