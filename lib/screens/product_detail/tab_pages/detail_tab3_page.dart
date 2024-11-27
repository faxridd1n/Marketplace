import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/screens/product_detail/widgets/detail_comment_widget.dart';
import 'package:flutter_application_1/screens/review/review_page.dart';

class PDetailPageTab3 extends StatefulWidget {
  const PDetailPageTab3({required this.productDetailModel, super.key});
  final ProductDetailModel productDetailModel;
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text(
          //         'Tartiblash:',
          //         style: TextStyle(
          //           color: AppColors.grey2,
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Container(
          //         height: 32,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(6),
          //           color: AppColors.grey1,
          //         ),
          //         child: ProductDetailPopUpWidget(),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewPage(
                        productDetailModel: widget.productDetailModel,
                      ),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  child: Text(
                    'Добавить отзыв',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
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
