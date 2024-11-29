import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_page.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
// import 'package:flutter_application_1/screens/home/home_bloc/home_bloc.dart';
import 'package:flutter_application_1/widgets/snack_bar.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page1.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../assets_path/app_images_path.dart';
import '../components/price_function.dart';
import '../screens/katalog/katalog_bloc/katalog_bloc.dart';

// ignore: must_be_immutable
class MiniProductWidget extends StatefulWidget {
  MiniProductWidget(
      {required this.index,
      required this.model,
      this.isSeeAllPage,
      this.isDetailPage,
      this.isHomePage,
      this.isKatalogPage,
      // this.tab,
      super.key});
  bool? isSeeAllPage;
  bool? isHomePage;
  bool? isKatalogPage;
  bool? isDetailPage;
  int index;
  ProductModel model;
  // int? tab;

  @override
  State<MiniProductWidget> createState() => _MiniProductWidgetState();
}

class _MiniProductWidgetState extends State<MiniProductWidget> {
  // bool isAddedBasket = false;
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            shadowColor: AppColors.black,
            color: AppColors.white,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage1(
                      productId: widget.model.id,
                      categoryId: widget.model.category.id,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: (widget.model.variations.isNotEmpty &&
                                      widget.model.variations[0].files
                                          .isNotEmpty &&
                                      widget.model.variations[0].files[0].url
                                          .isNotEmpty)
                                  ? Image.network(
                                      widget.model.variations[0].files[0].url,
                                      fit: BoxFit.fitHeight,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.model.variations[0].prices[0].type == 'Price'
                            ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} сум'
                            : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} сум',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.model.name,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          basketProductCount != 0
                              ? Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.all(0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: AppColors.grey1,
                                          ),
                                          onPressed: () {
                                            if (basketProductCount != 0) {
                                              basketProductCount -= 1;
                                              // isAddedBasket = true;

                                              if (widget.isHomePage == true) {
                                                context.read<BasketBloc>().add(
                                                      PostBasketProductBasketEvent(
                                                        productVariationId:
                                                            widget
                                                                .model
                                                                .variations[0]
                                                                .id,
                                                        count:
                                                            basketProductCount,
                                                      ),
                                                    );
                                              } else if (widget.isSeeAllPage ==
                                                  true) {
                                                context.read<SeeAllBloc>().add(
                                                      PostBasketProductSeeAllEvent(
                                                        productVariationId:
                                                            widget
                                                                .model
                                                                .variations[0]
                                                                .id,
                                                        count:
                                                            basketProductCount,
                                                      ),
                                                    );
                                              } else if (widget.isKatalogPage ==
                                                  true) {
                                                context.read<KatalogBloc>().add(
                                                      PostBasketProductKatalogEvent(
                                                        productVariationId:
                                                            widget
                                                                .model
                                                                .variations[0]
                                                                .id,
                                                        count:
                                                            basketProductCount,
                                                      ),
                                                    );
                                              } else if (widget.isDetailPage ==
                                                  true) {
                                                context
                                                    .read<ProductDetailBloc>()
                                                    .add(
                                                      PostBasketProductDetailEvent(
                                                        productVariationId:
                                                            widget
                                                                .model
                                                                .variations[0]
                                                                .id,
                                                        count:
                                                            basketProductCount,
                                                      ),
                                                    );
                                              } else {
                                                context.read<BasketBloc>().add(
                                                      PostBasketProductBasketEvent(
                                                        productVariationId:
                                                            widget
                                                                .model
                                                                .variations[0]
                                                                .id,
                                                        count:
                                                            basketProductCount,
                                                      ),
                                                    );
                                              }
                                              snackBar(
                                                isHomePage:
                                                    widget.isHomePage == true
                                                        ? true
                                                        : false,
                                                context: context,
                                                name: widget.model.name,
                                                addProduct: false,
                                              );
                                              setState(() {});
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor: AppColors.grey1,
                                          ),
                                          onPressed: () {
                                            basketProductCount += 1;
                                            // isAddedBasket = true;

                                            if (widget.isHomePage == true) {
                                              context.read<BasketBloc>().add(
                                                    PostBasketProductBasketEvent(
                                                      productVariationId: widget
                                                          .model
                                                          .variations[0]
                                                          .id,
                                                      count: basketProductCount,
                                                    ),
                                                  );
                                            } else if (widget.isSeeAllPage ==
                                                true) {
                                              context.read<SeeAllBloc>().add(
                                                    PostBasketProductSeeAllEvent(
                                                      productVariationId: widget
                                                          .model
                                                          .variations[0]
                                                          .id,
                                                      count: basketProductCount,
                                                    ),
                                                  );
                                            } else if (widget.isKatalogPage ==
                                                true) {
                                              context.read<KatalogBloc>().add(
                                                    PostBasketProductKatalogEvent(
                                                      productVariationId: widget
                                                          .model
                                                          .variations[0]
                                                          .id,
                                                      count: basketProductCount,
                                                    ),
                                                  );
                                            } else if (widget.isDetailPage ==
                                                true) {
                                              context
                                                  .read<ProductDetailBloc>()
                                                  .add(
                                                    PostBasketProductDetailEvent(
                                                      productVariationId: widget
                                                          .model
                                                          .variations[0]
                                                          .id,
                                                      count: basketProductCount,
                                                    ),
                                                  );
                                            } else {
                                              context.read<BasketBloc>().add(
                                                    PostBasketProductBasketEvent(
                                                      productVariationId: widget
                                                          .model
                                                          .variations[0]
                                                          .id,
                                                      count: basketProductCount,
                                                    ),
                                                  );
                                            }

                                            snackBar(
                                                isHomePage:
                                                    widget.isHomePage == true
                                                        ? true
                                                        : false,
                                                context: context,
                                                name: widget.model.name,
                                                addProduct: true);

                                            setState(() {});
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
                                        padding: EdgeInsets.all(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.green,
                                      ),
                                      onPressed: () {
                                        basketProductCount += 1;
                                        bool isAlreadyHave = false;
                                        setState(() {});
                                        if (basketProducts
                                            .contains(widget.model)) {
                                          isAlreadyHave = true;
                                          if (widget.isHomePage == true) {
                                            context.read<BasketBloc>().add(
                                                  PostBasketProductBasketEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: basketProductCount,
                                                  ),
                                                );
                                          } else if (widget.isSeeAllPage ==
                                              true) {
                                            context.read<SeeAllBloc>().add(
                                                  PostBasketProductSeeAllEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          } else if (widget.isKatalogPage ==
                                              true) {
                                            context.read<KatalogBloc>().add(
                                                  PostBasketProductKatalogEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          } else if (widget.isDetailPage ==
                                              true) {
                                            context
                                                .read<ProductDetailBloc>()
                                                .add(
                                                  PostBasketProductDetailEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                  ),
                                                );
                                          } else {
                                            context.read<BasketBloc>().add(
                                                  PostBasketProductBasketEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 2,
                                                  ),
                                                );
                                          }
                                        }
                                        if (!isAlreadyHave) {
                                          if (widget.isHomePage == true) {
                                            context.read<BasketBloc>().add(
                                                  PostBasketProductBasketEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          } else if (widget.isSeeAllPage ==
                                              true) {
                                            context.read<SeeAllBloc>().add(
                                                  PostBasketProductSeeAllEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          } else if (widget.isKatalogPage ==
                                              true) {
                                            context.read<KatalogBloc>().add(
                                                  PostBasketProductKatalogEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          } else if (widget.isDetailPage ==
                                              true) {
                                            context
                                                .read<ProductDetailBloc>()
                                                .add(
                                                  PostBasketProductDetailEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                  ),
                                                );
                                          } else {
                                            context.read<BasketBloc>().add(
                                                  PostBasketProductBasketEvent(
                                                    productVariationId: widget
                                                        .model.variations[0].id,
                                                    count: 1,
                                                  ),
                                                );
                                          }
                                        }
                                        snackBar(
                                            isHomePage:
                                                widget.isHomePage == true
                                                    ? true
                                                    : false,
                                            context: context,
                                            name: widget.model.name,
                                            addProduct: true);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          // vertical: 15,
                                        ),
                                        child: Text(
                                          'в корзину',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(width: 5),
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
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage1(
                                      productId: widget.model.id,
                                      categoryId: widget.model.category.id,
                                      // model: widget.model,
                                      // tab: null,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: SizedBox(
                    height: 25,
                    width: 25,
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
                        isSelected
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: isSelected ? AppColors.pink : AppColors.black,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
