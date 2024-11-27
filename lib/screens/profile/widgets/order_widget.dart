import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/price_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/profile_model/user_orders_model.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page1.dart';

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
    // '11:58, 09.10.2024'

    productCreatedDate +=
        '${widget.ordersModel.updatedDate.hour < 10 ? 0 : ''}${widget.ordersModel.updatedDate.hour}:${widget.ordersModel.updatedDate.minute < 10 ? 0 : ''}${widget.ordersModel.updatedDate.minute}, ';
    productCreatedDate +=
        '${widget.ordersModel.updatedDate.day < 10 ? 0 : ''}${widget.ordersModel.updatedDate.day}.${widget.ordersModel.updatedDate.month < 10 ? 0 : ''}${widget.ordersModel.updatedDate.month}.${widget.ordersModel.updatedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Removed fixed height
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(82, 0, 0, 0),
            blurRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensures dynamic height
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Заказ ID:',
                    style: TextStyle(
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
                  const Text(
                    'Статус:',
                    style: TextStyle(
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
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.red, width: 0.5),
                      color: const Color.fromARGB(108, 254, 154, 147),
                    ),
                    child: const Text(
                      'Возврат денег',
                      style: TextStyle(
                        color: AppColors.red,
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
                    )} сум',
                    style: const TextStyle(color: AppColors.green),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        showMore = !showMore;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Row(
                        children: [
                          Text(
                            showMore ? 'Коллапс' : 'Деталь',
                            style: const TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.w500,
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
                physics: NeverScrollableScrollPhysics(),
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
                                  .items[index].variation.product.id,
                              categoryId: widget.ordersModel.subOrders[0]
                                  .items[index].variation.product.categoryId,
                              // model: widget.ordersModel.subOrders[0].items[0],
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
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.ordersModel.subOrders[0].items[index]
                                        .variation.files[0].url,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: 70,
                              height: 70, // Flexible sizing
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
                                    )} сум',
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${widget.ordersModel.subOrders[0].items[index].count} шт. х ${addSpaceEveryThreeCharacters(
                                      widget
                                          .ordersModel
                                          .subOrders[0]
                                          .items[index]
                                          .variation
                                          .prices[0]
                                          .value
                                          .toInt()
                                          .toString(),
                                    )} сум',
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
