import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/price_function.dart';
import 'custom_cachedd_image.dart';
import 'login_dialog.dart';

class MiniProductWidget extends StatefulWidget {
  const MiniProductWidget({required this.model, super.key});

  final ProductModel model;

  @override
  State<MiniProductWidget> createState() => _MiniProductWidgetState();
}

class _MiniProductWidgetState extends State<MiniProductWidget> {
  int basketProductCount = 0;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();

    if (favoriteProducts.contains(widget.model)) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: AppColors.transparent,
      color: AppColors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailPage1(
                productId: widget.model.id,
                categoryId: widget.model.category.id,
                organizationId: widget.model.organizationId,
                // model: widget.model,
                // tab: widget.tab,
              ),
            ),
          );
        },
        child: Stack(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomCachedImage(
                        height: 140,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(8),
                        imageUrl: widget.model.variations[0].files[0].url,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                Text(
                  widget.model.variations[0].prices[0].type == 'Price'
                      ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} AED'
                      : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} AED',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // const SizedBox(height: 10),
                Text(
                  widget.model.name,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
                // const SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                          child: Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.yellow,
                            size: 20,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      widget.model.rating.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    basketProductCount != 0 &&
                            userTokenBox.get('token')!.token.isNotEmpty
                        ? Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: AppColors.grey1,
                                    ),
                                    onPressed: () {
                                      if (basketProductCount != 0) {
                                        // isAddedBasket = true;

                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: widget
                                                    .model.variations[0].id,
                                                count: basketProductCount,
                                              ),
                                            );
                                        setState(() {
                                          basketProductCount -= 1;
                                        });
                                        context.showPopUp(
                                          context,
                                          title:
                                              translation(context).successful,
                                          message: widget.model.name,
                                        );
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Text(
                                  basketProductCount.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: AppColors.grey1,
                                    ),
                                    onPressed: () {
                                      // isAddedBasket = true;
                                      setState(() {
                                        basketProductCount += 1;
                                      });
                                      context.read<BasketBloc>().add(
                                            PostBasketProductBasketEvent(
                                              productVariationId:
                                                  widget.model.variations[0].id,
                                              count: basketProductCount,
                                            ),
                                          );

                                      context.showPopUp(
                                        context,
                                        title: translation(context).successful,
                                        message: widget.model.name,
                                      );
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.green,
                                ),
                                onPressed: () {
                                  final token =
                                      userTokenBox.get('token')?.token;
                                  if (token != null && token.isNotEmpty) {
                                    setState(() {
                                      basketProductCount += 1;
                                    });
                                    context.read<BasketBloc>().add(
                                          PostBasketProductBasketEvent(
                                            productVariationId:
                                                widget.model.variations[0].id,
                                            count: basketProductCount,
                                          ),
                                        );
                                    context.showPopUp(
                                      context,
                                      title: translation(context).successful,
                                      message: widget.model.name,
                                    );
                                  } else {
                                    loginDiolog(context, () {
                                      setState(() {});
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    // vertical: 15,
                                  ),
                                  child: Text(
                                    translation(context).goToBasket,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    // const SizedBox(width: 5),
                    // SizedBox(
                    //   height: 35,
                    //   width: 35,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.all(0),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       backgroundColor: AppColors.grey1,
                    //     ),
                    //     onPressed: () {
                    //       Navigator.of(context, rootNavigator: true).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => ProductDetailPage1(
                    //             productId: widget.model.id,
                    //             categoryId: widget.model.category.id,
                    //             organizationId: widget.model.organizationId,
                    //             // model: widget.model,
                    //             // tab: null,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     child: const Icon(
                    //       Icons.remove_red_eye_outlined,
                    //       color: AppColors.black,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ),
                  
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.white,
              ),
              height: 40,
              width: 40,
              child: Center(
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    isSelected = !isSelected;
                    if (isSelected) {
                      favoriteProducts.add(widget.model);
                    } else {
                      favoriteProducts.remove(widget.model);
                    }
                    setState(() {});
                  },
                  icon: Icon(
                    isSelected ? Icons.favorite : Icons.favorite_border_rounded,
                    color: isSelected ? AppColors.pink : AppColors.black,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
