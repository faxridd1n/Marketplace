import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/buy_now_product_list_widget.dart';

class BuyNowProductList extends StatefulWidget {
  const BuyNowProductList(
      {required this.model, required this.organizationContactModel, super.key});
  final BasketProductModel model;
  final OrganizationContactModel organizationContactModel;

  @override
  BuyNowProductListState createState() => BuyNowProductListState();
}

class BuyNowProductListState extends State<BuyNowProductList> {
  bool isExpanded = true;
  List<String> basketProductsVariations = [];
  @override
  void initState() {
    super.initState();
    for (var e in widget.model.result.products) {
      basketProductsVariations.add(e.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Column(
        children: [
          ExpansionTile(
            onExpansionChanged: (value) {
              isExpanded = value;
              setState(() {});
            },
            trailing: isExpanded
                ? const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  )
                : const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                  ),
            iconColor: AppColors.grey2,
            collapsedIconColor: AppColors.grey2,
            tilePadding: const EdgeInsets.symmetric(horizontal: 0),
            shape: Border.all(color: AppColors.transparent),
            title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Solara',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
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
                    return BuyNowProductListWidget(
                      model: widget.model.result.products[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
