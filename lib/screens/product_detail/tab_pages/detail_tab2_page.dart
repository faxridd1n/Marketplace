import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            widget.model.result!.description!,
            style: const TextStyle(
              color: AppColors.grey2,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
