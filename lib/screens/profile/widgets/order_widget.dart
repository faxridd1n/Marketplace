import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/price_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/order_model/user_orders_model.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../assets_path/app_icons_path.dart';
import '../../../widgets/custom_cachedd_image.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({required this.ordersModel, super.key});
  final ResultItem ordersModel;
  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool showMore = false;

  String productCreatedDate = '';
  @override
  void initState() {
    super.initState();

    productCreatedDate +=
        '${widget.ordersModel.createdDate.substring(10, 16)},${widget.ordersModel.createdDate.substring(8, 10)}.${widget.ordersModel.createdDate.substring(5, 7)}.${widget.ordersModel.createdDate.substring(5, 7)}.${widget.ordersModel.createdDate.substring(0, 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey3),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.pageBgColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    translation(context).orderId,
                    style: const TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.ordersModel.id.toString(),
                    style: const TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    translation(context).status,
                    style: const TextStyle(
                      color: AppColors.grey2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: const Color.fromARGB(255, 57, 122, 244),
                          width: 0.5),
                      color: const Color.fromARGB(90, 192, 213, 251),
                    ),
                    child: Text(
                      translation(context).orderCreated,
                      style: const TextStyle(
                        color: AppColors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${addSpaceEveryThreeCharacters(
                      widget.ordersModel.subOrders[0].items[0].variation
                          .prices[0].value
                          .toInt()
                          .toString(),
                    )} AED',
                    style: const TextStyle(
                      color: AppColors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.location,
                        color: AppColors.grey2,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.ordersModel.address,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.5,
                                  color: AppColors.green,
                                ),
                              ),
                            ),
                            child: Text(
                              showMore
                                  ? translation(context).collapse
                                  : translation(context).details,
                              style: const TextStyle(
                                height: 1.15,
                                color: AppColors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            showMore
                                ? Icons.keyboard_arrow_up_sharp
                                : Icons.keyboard_arrow_down_sharp,
                            color: AppColors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                productCreatedDate,
                style: const TextStyle(
                  color: AppColors.grey2,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          AnimatedCrossFade(
            firstChild: SizedBox(
              height: 85.0 * widget.ordersModel.subOrders[0].items.length,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.ordersModel.subOrders[0].items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailPage1(
                              productId: widget.ordersModel.subOrders[0]
                                  .items[index].variation.productId,
                              categoryId: widget.ordersModel.subOrders[0]
                                  .items[index].variation.product.categoryId,
                              organizationId: widget
                                  .ordersModel.subOrders[0].organizationId,
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomCachedImage(
                              height: 70,
                              width: 70,
                              borderRadius: BorderRadius.circular(8),
                              imageUrl: widget.ordersModel.subOrders[0]
                                  .items[index].variation.files[0].url,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${addSpaceEveryThreeCharacters(
                                      widget
                                          .ordersModel
                                          .subOrders[0]
                                          .items[index]
                                          .variation
                                          .prices[0]
                                          .value
                                          .toInt()
                                          .toString(),
                                    )} AED',
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${widget.ordersModel.subOrders[0].items[index].count} ${translation(context).count} х ${addSpaceEveryThreeCharacters(
                                      widget
                                          .ordersModel
                                          .subOrders[0]
                                          .items[index]
                                          .variation
                                          .prices[0]
                                          .value
                                          .toInt()
                                          .toString(),
                                    )} AED',
                                    style: const TextStyle(
                                      color: AppColors.grey2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.ordersModel.subOrders[0].items[index]
                                        .variation.product.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            secondChild: const SizedBox(),
            crossFadeState:
                showMore ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
