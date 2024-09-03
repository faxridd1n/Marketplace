import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/basket_response_model.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_application_1/service/basket_service/basket_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class BasketProductWidget extends StatefulWidget {
  BasketProductWidget(
      {required this.model,
      required this.index,
      required this.isSelected,
      super.key});
  BasketResponseModel model;
  int index;
  bool isSelected;
  @override
  State<BasketProductWidget> createState() => _BasketProductWidgetState();
}

class _BasketProductWidgetState extends State<BasketProductWidget> {
  int productCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: MediaQuery.of(context).size.width,
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  checkColor: Colors.white,
                  activeColor: AppColors.green,
                  value: isAllSelected ? true : widget.isSelected,
                  onChanged: (value) {
                    setState(() {
                      widget.isSelected = value!;
                      if (widget.isSelected) {
                        selectedProducts.add(
                          widget.model.result!.products![widget.index],
                        );

                        for (var r in widget
                            .model.result!.products![widget.index].prices!) {
                          if (r.type == "Price") {
                            dealSum += r.value!.toInt();
                          }
                        }
                      } else {
                        selectedProducts.remove(widget.model);
                        for (var r in widget
                            .model.result!.products![widget.index].prices!) {
                          if (r.type == "Price") {
                            dealSum -= r.value!.toInt();
                          }
                        }
                      }
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 90,
                width: 60,
                child: Image.network(
                  widget.model.result!.products![widget.index].files![0].url!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.model.result!.products![widget.index]
                                        .prices![0].type ==
                                    'Price'
                                ? '${widget.model.result!.products![widget.index].prices![0].value!.toInt()} сум'
                                : '${widget.model.result!.products![widget.index].prices![1].value!.toInt()} сум',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.yellow,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: const Text(
                              'x 12 мес',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '180 000 сум',
                        style: TextStyle(
                          // decoration: TextDecoration.lineThrough,
                          color: AppColors.grey3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      widget
                          .model.result!.products![widget.index].product!.name!,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final response = await BasketService.deleteBasketProducts(
                      widget.model.result!.products![widget.index].prices![0]
                          .variationId!);
                  setState(() {
                    for (var e in basketProducts) {
                      if (e.id == widget.model.result!.id) {
                        basketProducts.remove(e);
                        setState(() {});
                      }
                    }
                  });
                },
                child: Container(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    AppIcons.xIcon,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        productCount != 1
                            ? productCount -= 1
                            : productCount = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.borderColor,
                      ),
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color:
                            productCount == 1 ? AppColors.grey2 : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    productCount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        productCount += 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.borderColor,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
