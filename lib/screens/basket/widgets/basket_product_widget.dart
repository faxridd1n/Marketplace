import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/basket_model/basket_response_model.dart';
import 'package:flutter_application_1/screens/basket/BasketPage.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/snack_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BasketProductWidget extends StatefulWidget {
  BasketProductWidget(
      {required this.model,
      required this.index,
      required this.isSelected,
      super.key});
  BasketProductElement model;
  int index;
  bool isSelected;
  @override
  State<BasketProductWidget> createState() => _BasketProductWidgetState();
}

class _BasketProductWidgetState extends State<BasketProductWidget> {
  int productCount = 0;
  @override
  void initState() {
    productCount = widget.model.count ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
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
                      value: widget.isSelected
                          ? true
                          : selectedProducts.contains(widget.model)
                              ? true
                              : false,
                      onChanged: (value) {
                        widget.isSelected = value!;
                        if (value) {
                          selectedProducts.add(widget.model);

                          for (var r in widget.model.prices!) {
                            if (r.type == "Price") {
                              dealSum += r.value!.toInt();
                            }
                          }
                        } else {
                          selectedProducts.remove(widget.model);
                          for (var r in widget.model.prices!) {
                            if (r.type == "Price") {
                              dealSum -= r.value!.toInt();
                            }
                          }
                        }
                        setState(() {});
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
                      widget.model.files![0].url!,
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
                                widget.model.prices![0].type == 'Price'
                                    ? '${widget.model.prices![0].value!.toInt()} сум'
                                    : '${widget.model.prices![1].value!.toInt()} сум',
                                style: const TextStyle(
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
                          widget.model.product!.name!,
                          maxLines: 2,
                          style: const TextStyle(
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
                    onTap: () {
                      context.read<BasketBloc>().add(
                            DeleteBasketProductsEvent(
                              widget.model.prices![0].variationId!,
                            ),
                          );

                      snackBar(
                        context: context,
                        name: widget.model.product!.name!,
                        addProduct: false,
                      );
                      setState(() {
                        for (var e in basketProducts) {
                          if (e.id == widget.model.id) {
                            basketProducts.remove(e);
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
                            if (productCount != 1) {
                              productCount -= 1;
                              context.read<BasketBloc>().add(
                                    PostBasketProductBasketEvent(
                                      widget.model.prices![0].variationId!,
                                      productCount,
                                    ),
                                  );
                            } else if (productCount == 1) {
                              context.read<BasketBloc>().add(
                                    DeleteBasketProductsEvent(
                                      widget.model.prices![0].variationId!,
                                    ),
                                  );

                              snackBar(
                                context: context,
                                name: widget.model.product!.name!,
                                addProduct: false,
                              );
                              setState(() {
                                for (var e in basketProducts) {
                                  if (e.id == widget.model.id) {
                                    basketProducts.remove(e);
                                  }
                                }
                              });
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.borderColor,
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 20,
                            color: productCount == 1
                                ? AppColors.grey2
                                : Colors.black,
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
                            context.read<BasketBloc>().add(
                                  PostBasketProductBasketEvent(
                                    widget.model.prices![0].variationId!,
                                    productCount,
                                  ),
                                );
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
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
      },
    );
  }
}
