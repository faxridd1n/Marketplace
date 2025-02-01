import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/components/number_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/screens/basket/widgets/basket_product_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../basket_bloc/basket_bloc.dart';

class BasketProductListWidget extends StatefulWidget {
  const BasketProductListWidget(
      {required this.model, required this.organizationContactModel, super.key});
  final BasketProductModel model;
  final OrganizationContactModel organizationContactModel;

  @override
  BasketProductListWidgetState createState() => BasketProductListWidgetState();
}

class BasketProductListWidgetState extends State<BasketProductListWidget> {
  bool isExpanded = true;
  List<String> basketProductsVariations = [];
  @override
  void initState() {
    super.initState();
    for (var e in widget.model.result.products) {
      basketProductsVariations.add(e.id);
    }
  }

  final String googleMapsUrl =
      "geo:37.7749,-122.4194"; // Replace with desired coordinates
  final String webUrl =
      "https://www.google.com/maps/search/?api=1&query=37.7749,-122.4194";

  Future<void> _openMap() async {
    Uri googleMapsUri = Uri.parse(googleMapsUrl);
    Uri webUri = Uri.parse(webUrl);

    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
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
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.organizationContactModel.result.organizationName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            initiallyExpanded: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.organizationContactModel.result.address),
                  Text(
                    numberFunction(
                        widget.organizationContactModel.result.phone),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: _openMap,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        color: AppColors.green,
                      ),
                      const SizedBox(width: 5),
                      Text(translation(context).showInMap),
                    ],
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
                      isSelected: false,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<BasketBloc>().add(
                    DeleteAllBasketProductsEvent(
                      basketProductsVariations,
                    ),
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.delete,
                  size: 20,
                  color: AppColors.red,
                ),
                const SizedBox(width: 5),
                Text(
                  translation(context).clearCart,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
