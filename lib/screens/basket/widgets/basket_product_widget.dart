import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/widgets/custom_cachedd_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/price_function.dart';

class BasketProductWidget extends StatefulWidget {
  const BasketProductWidget(
      {required this.model, required this.isSelected, super.key});
  final ProductElement model;
  final bool isSelected;
  @override
  State<BasketProductWidget> createState() => _BasketProductWidgetState();
}

class _BasketProductWidgetState extends State<BasketProductWidget> {
  int productCount = 0;
  @override
  void initState() {
    productCount = widget.model.count;

    super.initState();
  }

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
            height: 90,
            imageUrl: widget.model.files[0].url,
            fit: BoxFit.fitHeight,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.model.prices[0].type == 'Price'
                          ? '${addSpaceEveryThreeCharacters(widget.model.prices[0].value.toInt().toString())} AED'
                          : '${addSpaceEveryThreeCharacters(widget.model.prices[0].value.toInt().toString())} AED',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<BasketBloc>().add(
                              DeleteBasketProductsEvent(
                                widget.model.prices[0].variationId,
                              ),
                            );

                        context.showPopUp(
                          context,
                          title: 'Successful!',
                          message: widget.model.product.name,
                        );
                      },
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: SvgPicture.asset(
                          AppIcons.xIcon,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.model.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
                                  PostBasketProductCountBasketEvent(
                                    widget.model.prices[0].variationId,
                                    productCount,
                                  ),
                                );
                            context.showPopUp(
                              context,
                              title: "Successful!",
                              message: widget.model.product.name,
                            );
                          } else if (productCount == 1) {
                            context.read<BasketBloc>().add(
                                  DeleteBasketProductsEvent(
                                    widget.model.prices[0].variationId,
                                  ),
                                );

                            context.showPopUp(
                              context,
                              title: "Successful!",
                              message: widget.model.product.name,
                            );
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
                              : AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      productCount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          productCount += 1;
                          context.read<BasketBloc>().add(
                                PostBasketProductCountBasketEvent(
                                  widget.model.prices[0].variationId,
                                  productCount,
                                ),
                              );
                          context.showPopUp(
                            context,
                            title: 'Successful!',
                            message: widget.model.product.name,
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
          ),
        ],
      ),
    );
  }
}
