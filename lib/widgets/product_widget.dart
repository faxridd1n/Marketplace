import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
import 'package:flutter_application_1/widgets/login_dialog.dart';
import 'package:flutter_application_1/widgets/snack_bar.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page1.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../assets_path/app_images_path.dart';
import '../components/price_function.dart';
import '../screens/katalog/katalog_bloc/katalog_bloc.dart';

// ignore: must_be_immutable
class ProductWidget extends StatefulWidget {
  ProductWidget(
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
  State<ProductWidget> createState() => _ProductwidgetState();
}

class _ProductwidgetState extends State<ProductWidget> {
  bool isFavorite = false;
  int basketProductCount = 0;
  late final bool isAuthed;
  @override
  void initState() {
    super.initState();

    if (favoriteProducts.contains(widget.model)) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => BasketBloc(),
      child: Card(
        elevation: 5,
        shadowColor: AppColors.black.withOpacity(0.5),
        color: AppColors.white,
        child: GestureDetector(
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
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
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
                  // const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.model.variations[0].prices[0].type == 'Price'
                          ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} AED'
                          : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} AED',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           widget.model.variations[0].prices[0].type ==
                  //                   'Price'
                  //               ? '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[0].value.toInt().toString())} сум'
                  //               : '${addSpaceEveryThreeCharacters(widget.model.variations[0].prices[1].value.toInt().toString())} сум',
                  //           style: const TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //         const Text(
                  //           '180 000 сум',
                  //           style: TextStyle(
                  //             color: AppColors.grey3,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(100),
                  //         color: AppColors.yellow,
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 5,
                  //         vertical: 2,
                  //       ),
                  //       child: const Text(
                  //         'x 12 мес',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),

                  // const SizedBox(height: 15),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 1, vertical: 10),
                            child: Icon(
                              Icons.star_rate_rounded,
                              color: AppColors.yellow,
                              size: 25,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        '5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 15),
                  Row(
                    children: [
                      if (basketProductCount != 0 &&
                          userTokenBox.get('token')!.token.isNotEmpty)
                        Expanded(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
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
                                height: 50,
                                width: 50,
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
                                              count: basketProductCount,
                                            ),
                                          );
                                    } else if (widget.isKatalogPage ==
                                        true) {
                                      context.read<KatalogBloc>().add(
                                            PostBasketProductKatalogEvent(
                                              productVariationId: widget
                                                  .model.variations[0].id,
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
                                                  .model.variations[0].id,
                                              count: basketProductCount,
                                            ),
                                          );
                                    } else {
                                      context.read<BasketBloc>().add(
                                            PostBasketProductBasketEvent(
                                              productVariationId: widget
                                                  .model.variations[0].id,
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
                      else
                        Expanded(
                          child: SizedBox(
                            height: 50,
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
                                  final variationId =
                                      widget.model.variations[0].id;
                                  basketProductCount += 1;
                                  context.read<BasketBloc>().add(
                                        PostBasketProductBasketEvent(
                                          productVariationId: variationId,
                                          count: basketProductCount,
                                        ),
                                      );

                                  // if (widget.isHomePage == true) {
                                  //   context.read<BasketBloc>().add(
                                  //         PostBasketProductBasketEvent(
                                  //           productVariationId: variationId,
                                  //           count: 2,
                                  //         ),
                                  //       );
                                  // } else if (widget.isSeeAllPage == true) {
                                  //   context.read<SeeAllBloc>().add(
                                  //         PostBasketProductSeeAllEvent(
                                  //           productVariationId: variationId,
                                  //           count: 1,
                                  //         ),
                                  //       );
                                  // } else if (widget.isKatalogPage == true) {
                                  //   context.read<KatalogBloc>().add(
                                  //         PostBasketProductKatalogEvent(
                                  //           productVariationId: variationId,
                                  //           count: 1,
                                  //         ),
                                  //       );
                                  // } else if (widget.isDetailPage == true) {
                                  //   context.read<ProductDetailBloc>().add(
                                  //         PostBasketProductDetailEvent(
                                  //           productVariationId: variationId,
                                  //         ),
                                  //       );
                                  // } else {
                                  //   context.read<BasketBloc>().add(
                                  //         PostBasketProductBasketEvent(
                                  //           productVariationId: variationId,
                                  //           count: 2,
                                  //         ),
                                  //       );
                                  // }

                                  snackBar(
                                    isHomePage: widget.isHomePage == true,
                                    context: context,
                                    name: widget.model.name,
                                    addProduct: true,
                                  );
                                  setState(() {});
                                } else {
                                  loginDiolog(context, () {
                                    setState(() {});
                                  });
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                child: Text(
                                  'в корзину',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 5),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.grey1,
                          ),
                          onPressed: () {
                            // Navigator.of(context, rootNavigator: true)
                            //     .push(
                            //   MaterialPageRoute(
                            //     builder: (context) => ProductDetailDialog(
                            //      model: widget.model,
                            //     ),
                            //   ),
                            // );
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
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  isFavorite = !isFavorite;
                  if (isFavorite) {
                    favoriteProducts.add(widget.model);
                  } else {
                    favoriteProducts.remove(widget.model);
                  }
                  setState(() {});
                },
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  color: isFavorite ? AppColors.pink : AppColors.black,
                  size: 25,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
