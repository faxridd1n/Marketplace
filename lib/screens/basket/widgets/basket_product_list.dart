import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_widget.dart';

class BasketProductListWidget extends StatefulWidget {
  const BasketProductListWidget({required this.model, super.key});
  final BasketProductModel model;

  @override
  BasketProductListWidgetState createState() => BasketProductListWidgetState();
}

class BasketProductListWidgetState extends State<BasketProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Color.fromARGB(91, 0, 0, 0),
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: ExpansionTile(
        iconColor: AppColors.grey2,
        collapsedIconColor: AppColors.grey2,
        tilePadding: const EdgeInsets.all(0),
        shape: Border.all(color: AppColors.transparent),
        // iconColor: AppColors.grey2,
        // collapsedIconColor: AppColors.grey2,
        // leading: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(7),
        //   ),
        //   height: 45,
        //   width: 45,
        //   child: ClipRRect(
        //     // Ensures that the image respects the rounded borders
        //     borderRadius: BorderRadius.circular(7),
        //     child: FadeInImage(
        //       fit: BoxFit.fill,
        //       placeholder: const AssetImage(
        //         AppImages.noImage, // Placeholder while image is loading
        //       ),
        //       image: NetworkImage(
        //         widget.model.item?[parentIndex].image?.url ?? AppImages.noImage,
        //       ),
        //       imageErrorBuilder: (context, error, stackTrace) {
        //         return Container(
        //           width: 40,
        //           height: 40,
        //           decoration: const BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage(
        //                   AppImages.noImage), // Fallback in case of error
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),

        title: const Text(
          'Solara',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),

        initiallyExpanded: true,
        children: [
          SizedBox(
            height: widget.model.result.products.length * 140,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.model.result.products.length,
              itemBuilder: (context, index) {
                return BasketProductWidget(
                  model: widget.model.result.products[index],
                  index: index,
                  isSelected: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
