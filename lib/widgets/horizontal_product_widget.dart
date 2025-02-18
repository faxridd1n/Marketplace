import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import '../components/price_function.dart';
import '../screens/favorite/favorite_page.dart';
import '../screens/navigation/navigation_page.dart';
import '../user_auth_bloc/user_auth_bloc.dart';
import '../user_auth_bloc/user_auth_state.dart';
import 'custom_cachedd_image.dart';
import 'login_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/product_detail/product_detail_page.dart';

class HorizontalProductWidget extends StatefulWidget {
  const HorizontalProductWidget({required this.model, super.key});

  final ProductModel model;

  @override
  State<HorizontalProductWidget> createState() =>
      _HorizontalProductWidgetState();
}

class _HorizontalProductWidgetState extends State<HorizontalProductWidget> {
  bool isSelected = false;
  int basketProductCount = 0;
  late final bool isAuthed;
  int index = 0;
  int discount = 0;
  int priceIndex = 0;
  int saleIndex = 0;

  @override
  void initState() {
    super.initState();

    if (favoriteProducts.contains(widget.model)) {
      isSelected = true;
    } else {
      isSelected = false;
    }

    var result =
        context.read<BasketBloc>().state.basketResponseModel.result.products;
    if (result.isNotEmpty) {
      for (var e in result) {
        if (e.productId == widget.model.id) {
          index = result.indexOf(e);
          basketProductCount = e.count;
        }
      }
    } else {
      basketProductCount = 0;
    }
    for (var price in widget.model.variations[0].prices) {
      if (price.type == 'Price' && price.value != 0) {
        priceIndex = widget.model.variations[0].prices.indexOf(price);

        for (var salePrice in widget.model.variations[0].prices) {
          if (salePrice.type == 'Sale' && salePrice.value != 0) {
            saleIndex = widget.model.variations[0].prices.indexOf(salePrice);
            discount = (100 - price.value * 100 / salePrice.value).toInt();
          }
        }
      }
    }
    isAuthed = context.read<AuthenticationBloc>().state.userAuthStatus ==
        AuthStatus.authenticated;

    if (favoriteProducts.contains(widget.model)) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        var result = context
            .read<BasketBloc>()
            .state
            .basketResponseModel
            .result
            .products;

        if (result.isNotEmpty) {
          for (var e in result) {
            if (e.productId == widget.model.id) {
              index = result.indexOf(e);
              basketProductCount = e.count;
            }
          }
        } else {
          basketProductCount = 0;
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (ctx) => HomeTabControllerProvider(
                  controller: HomeTabControllerProvider.of(context).controller,
                  child: ProductDetailPage1(
                    productId: widget.model.id,
                    categoryId: widget.model.category.id,
                    organizationId: widget.model.organizationId,
                  ),
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCachedImage(
                      height: 120,
                      fit: BoxFit.fitWidth,
                      width: 80,
                      borderRadius: BorderRadius.circular(8),
                      imageUrl: widget.model.variations[0].files[0].url,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.model.name,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {
                                    setState(
                                      () {
                                        isSelected = !isSelected;
                                        if (isSelected) {
                                          favoriteProducts.add(widget.model);
                                        } else {
                                          favoriteProducts.remove(widget.model);
                                        }
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    isSelected
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,
                                    color: isSelected
                                        ? AppColors.pink
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5)
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1, vertical: 5),
                                    child: Icon(
                                      Icons.star_rate_rounded,
                                      color: AppColors.yellow,
                                      size: 20,
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                '5',
                                // widget.model.rating.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${addSpaceEveryThreeCharacters(
                                      widget.model.variations[0]
                                          .prices[priceIndex].value
                                          .toInt()
                                          .toString(),
                                    )} AED',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (discount != 0)
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${addSpaceEveryThreeCharacters(
                                          widget.model.variations[0]
                                              .prices[saleIndex].value
                                              .toInt()
                                              .toString(),
                                        )} AED',
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: AppColors.pink,
                                          color: AppColors.pink,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              basketProductCount != 0 && isAuthed
                                  ? Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                backgroundColor:
                                                    AppColors.grey1,
                                              ),
                                              onPressed: () {
                                                if (basketProductCount == 1) {
                                                  setState(() {
                                                    basketProductCount = 0;
                                                  });
                                                  final variationId = widget
                                                      .model.variations[0].id;
                                                  context
                                                      .read<BasketBloc>()
                                                      .add(
                                                        DeleteBasketProductsEvent(
                                                          productVariationId:
                                                              variationId,
                                                        ),
                                                      );

                                                  context.showPopUp(
                                                    isSucces: true,
                                                    context,
                                                    title: translation(context)
                                                        .successful,
                                                    message: widget.model.name,
                                                  );
                                                } else if (basketProductCount >
                                                    1) {
                                                  setState(() {
                                                    basketProductCount -= 1;
                                                  });
                                                  context
                                                      .read<BasketBloc>()
                                                      .add(
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

                                                  context.showPopUp(
                                                    isSucces: true,
                                                    context,
                                                    title: translation(context)
                                                        .successful,
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
                                          const SizedBox(width: 15),
                                          SizedBox(
                                            width: 25,
                                            child: Text(
                                              basketProductCount.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          SizedBox(
                                            height: 35,
                                            width: 35,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                backgroundColor:
                                                    AppColors.grey1,
                                              ),
                                              onPressed: () {
                                                // isAddedBasket = true;
                                                setState(() {
                                                  basketProductCount += 1;
                                                });
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

                                                context.showPopUp(
                                                  isSucces: true,
                                                  context,
                                                  title: translation(context)
                                                      .successful,
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
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.green,
                                      ),
                                      onPressed: () {
                                        if (isAuthed) {
                                          setState(() {
                                            basketProductCount = 1;
                                          });
                                          context.read<BasketBloc>().add(
                                                PostBasketProductBasketEvent(
                                                  productVariationId: widget
                                                      .model.variations[0].id,
                                                  count: basketProductCount,
                                                ),
                                              );
                                          context.showPopUp(
                                            isSucces: true,
                                            context,
                                            title:
                                                translation(context).successful,
                                            message: widget.model.name,
                                          );
                                        } else {
                                          loginDiolog(context, () {
                                            setState(() {});
                                          });
                                        }
                                      },
                                      child: Text(
                                        translation(context).goToBasket,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (discount != 0)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '-$discount%',
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
