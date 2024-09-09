import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/product_detail_model/ProductDetailModel.dart';

// ignore: must_be_immutable
class PDetailPageTab1 extends StatefulWidget {
  PDetailPageTab1({required this.model, super.key});
  ProductDetailModel model;
  @override
  State<PDetailPageTab1> createState() => _PDetailPageTab1State();
}

class _PDetailPageTab1State extends State<PDetailPageTab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: ListView.builder(
          itemCount:
              widget.model.result!.variations![0].attributeValues!.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: index % 2 == 0 ? AppColors.grey1 : Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.36,
                      child: Text(
                        widget.model.result!.variations![0]
                            .attributeValues![index].attribute!.name!,
                        style: TextStyle(
                          color: AppColors.grey2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        widget.model.result!.variations![0]
                            .attributeValues![index].value!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
