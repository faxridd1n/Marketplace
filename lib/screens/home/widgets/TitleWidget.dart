import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  TitleWidget({required this.titleText, required this.withSeeAllButton});
  bool withSeeAllButton;
  String titleText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          withSeeAllButton
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          withSeeAllButton
              ? GestureDetector(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        'Смотреть всё',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.grey2,
                        size: 20,
                      )
                    ],
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
