import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/components/number_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketProductListWidget extends StatefulWidget {
  const BasketProductListWidget(
      {required this.model, required this.organizationContactModel, super.key});
  final BasketProductModel model;
  final OrganizationContactModel organizationContactModel;

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
        title: const Text(
          'Solara',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        initiallyExpanded: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.organizationContactModel.result.address),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.location,
                      color: AppColors.green,
                    ),
                    const SizedBox(width: 5),
                    const Text('Показать на карте'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              numberFunction(widget.organizationContactModel.result.phone),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
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
