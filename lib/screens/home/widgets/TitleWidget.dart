import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {
  TitleWidget(
      {required this.titleText,
      required this.withSeeAllButton,
      required this.tab});
  bool withSeeAllButton;
  String titleText;
  int? tab;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          withSeeAllButton
              ? Expanded(
                  child: Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : Expanded(
                  child: Text(
                    titleText,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          const SizedBox(width: 5),
          withSeeAllButton
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeeAllPage(
                          tab: tab!,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Смотреть всё',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.grey2,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
