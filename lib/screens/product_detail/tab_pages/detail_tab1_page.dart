import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';

class PDetailPageTab1 extends StatefulWidget {
  final ProductDetailModel model;

  const PDetailPageTab1({required this.model, super.key});

  @override
  State<PDetailPageTab1> createState() => _PDetailPageTab1State();
}

class _PDetailPageTab1State extends State<PDetailPageTab1> {
  @override
  Widget build(BuildContext context) {
    // Extract variations and attributes for readability
    final variations = widget.model.result.variations;
    final attributeValues =
        variations.isNotEmpty == true ? variations.first.attributeValues : null;

    // If no attributes, display a message
    if (attributeValues == null || attributeValues.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30, top: 20),
          child: Text(
            'Характеристики не найден',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    // Build the list of attributes
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: ListView.builder(
        itemCount: attributeValues.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final attribute = attributeValues[index].attribute;
          final value = attributeValues[index].value;

          return Container(
            color: index % 2 == 0 ? AppColors.grey1 : AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            child: Row(
              children: [
                // Attribute name
                Expanded(
                  flex: 4,
                  child: Text(
                    attribute.name.isNotEmpty ? attribute.name : 'N/A',
                    style: const TextStyle(
                      color: AppColors.grey2,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                // Attribute value
                Expanded(
                  flex: 5,
                  child: Text(
                    value.isNotEmpty ? value : 'N/A',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
