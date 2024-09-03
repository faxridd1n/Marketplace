import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/DetailPageCommentWidget.dart';
import 'package:flutter_application_1/screens/home/other_pages/other_page_widgets/ProductDetailPopUpWidget.dart';

enum SingingCharacter { var1, var2, var3 }

class PDetailPageTab3 extends StatefulWidget {
  const PDetailPageTab3({super.key});

  @override
  State<PDetailPageTab3> createState() => _PDetailPageTab3State();
}

class _PDetailPageTab3State extends State<PDetailPageTab3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tartiblash:',
                  style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.grey1,
                  ),
                  child: ProductDetailPopUpWidget(),
                ),
              ],
            ),
          ),
          SizedBox(
            child: ListView.builder(
                itemCount: 1,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const DetailPageCommentWidget();
                }),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
