import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/product_detail_model/ProductDetailModel.dart';

// ignore: must_be_immutable
class PDetailPageTab2 extends StatefulWidget {
  PDetailPageTab2({required this.model, super.key});
  ProductDetailModel model;
  @override
  State<PDetailPageTab2> createState() => _PDetailPageTab2State();
}

class _PDetailPageTab2State extends State<PDetailPageTab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            widget.model.result!.description!,
            style: TextStyle(
              color: AppColors.grey2,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
