import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';

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
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      translation(context).seeAll,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.grey2,
                      size: 25,
                    )
                  ],
                ),
              ),
            )
          }
        ],
      ),
    );
  }
}
