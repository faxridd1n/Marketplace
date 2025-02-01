import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/basket_model/basket_product_model.dart';
import '../../../widgets/custom_cachedd_image.dart';

class BuyNowProductListWidget extends StatefulWidget {
  const BuyNowProductListWidget({required this.model, super.key});
  final ProductElement model;

  @override
  State<BuyNowProductListWidget> createState() =>
      _BuyNowProductListWidgetState();
}

class _BuyNowProductListWidgetState extends State<BuyNowProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCachedImage(
            width: 90,
            borderRadius: BorderRadius.circular(8),
            imageUrl: widget.model.files[0].url,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.model.prices[0].value} AED',
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.model.product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Количество: ",
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.model.count} шт.',
                        style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
