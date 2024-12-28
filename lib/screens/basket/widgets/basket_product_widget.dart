import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/basket_model/basket_product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_page.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/widgets/snack_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/price_function.dart';

class BasketProductWidget extends StatefulWidget {
  const BasketProductWidget(
      {required this.model,
      required this.index,
      required this.isSelected,
      super.key});
  final ProductElement model;
  final int index;
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
        vertical: 15,
      ),
      width: MediaQuery.of(context).size.width,
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: (widget.model.files.isNotEmpty &&
                      widget.model.files[0].url.isNotEmpty)
                  ? Image.network(
                      widget.model.files[0].url,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.noImage,
                          fit: BoxFit.fitHeight,
                        );
                      },
                    )
                  : Image.asset(
                      AppImages.noImage,
                      fit: BoxFit.fitWidth,
                    ),
            ),
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
                    Expanded(
                      child: Text(
                        widget.model.product.name,
                        // maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        context.read<BasketBloc>().add(
                              DeleteBasketProductsEvent(
                                widget.model.prices[0].variationId,
                              ),
                            );

                        context.showPopUp(
                          context,
                          title: 'Удалено успешно!',
                          message: "${widget.model.product.name} удалено из корзины",
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.model.prices[0].type == 'Price'
                                  ? addSpaceEveryThreeCharacters(widget
                                      .model.prices[0].value
                                      .toInt()
                                      .toString())
                                  : addSpaceEveryThreeCharacters(widget
                                      .model.prices[0].value
                                      .toInt()
                                      .toString()),
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
                            color: AppColors.grey3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
                              } else if (productCount == 1) {
                                context.read<BasketBloc>().add(
                                      DeleteBasketProductsEvent(
                                        widget.model.prices[0].variationId,
                                      ),
                                    );

                                context.showPopUp(
                                  context,
                                  title: "Удалено успешно!",
                                  message: "${widget.model.product.name} удалено из корзины",
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
                                    PostBasketProductCountBasketEvent(
                                      widget.model.prices[0].variationId,
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
          ),
        ],
      ),
    );
  }
}
