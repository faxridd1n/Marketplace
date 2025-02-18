import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/favorite/favorite_page.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_application_1/widgets/custom_cachedd_image.dart';
import 'package:flutter_application_1/widgets/login_dialog.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/price_function.dart';
import '../screens/navigation/navigation_page.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({required this.model, super.key});
  final ProductModel model;

  @override
  State<ProductWidget> createState() => _ProductwidgetState();
}

class _ProductwidgetState extends State<ProductWidget> {
  bool isFavorite = false;
  int basketProductCount = 0;
  late final bool isAuthed;
  int index = 0;
  int discount = 0;
  int priceIndex = 0;
  int saleIndex = 0;
  @override
  void initState() {
    super.initState();
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
      isFavorite = true;
    } else {
      isFavorite = false;
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
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Card(
            elevation: 5,
            shadowColor: AppColors.black.withOpacity(0.5),
            color: AppColors.white,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (ctx) => HomeTabControllerProvider(
                      controller:
                          HomeTabControllerProvider.of(context).controller,
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
                    width: MediaQuery.of(context).size.width * 0.55,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CustomCachedImage(
                              height: 190,
                              width: double.infinity,
                              fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(8),
                              imageUrl: widget.model.variations[0].files[0].url,
                            ),
                          ),
                        ),
                        if (discount != 0)
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${addSpaceEveryThreeCharacters(
                                widget
                                    .model.variations[0].prices[saleIndex].value
                                    .toInt()
                                    .toString(),
                              )} AED',
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.pink,
                                color: AppColors.pink,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (discount != 0) const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${addSpaceEveryThreeCharacters(
                              widget
                                  .model.variations[0].prices[priceIndex].value
                                  .toInt()
                                  .toString(),
                            )} AED',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          widget.model.name,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1,
                                    vertical: 10,
                                  ),
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
                        Row(
                          children: [
                            basketProductCount != 0 && isAuthed
                                ? Expanded(
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
                                              if (basketProductCount == 1) {
                                                final variationId = widget
                                                    .model.variations[0].id;
                                                context.read<BasketBloc>().add(
                                                      DeleteBasketProductsEvent(
                                                        productVariationId:
                                                            variationId,
                                                      ),
                                                    );
                                                setState(() {
                                                  basketProductCount = 0;
                                                });
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
                                                final variationId = widget
                                                    .model.variations[0].id;
                                                context.read<BasketBloc>().add(
                                                      PostBasketProductBasketEvent(
                                                        productVariationId:
                                                            variationId,
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
                                              setState(() {
                                                basketProductCount += 1;
                                              });
                                              final variationId =
                                                  widget.model.variations[0].id;
                                              context.read<BasketBloc>().add(
                                                    PostBasketProductBasketEvent(
                                                      productVariationId:
                                                          variationId,
                                                      count: basketProductCount,
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
                                : Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
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

                                            final variationId =
                                                widget.model.variations[0].id;
                                            context.read<BasketBloc>().add(
                                                  PostBasketProductBasketEvent(
                                                    productVariationId:
                                                        variationId,
                                                    count: basketProductCount,
                                                  ),
                                                );

                                            context.showPopUp(
                                              context,
                                              isSucces: true,
                                              title: translation(context)
                                                  .successful,
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
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                          child: Text(
                                            translation(context).goToBasket,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            // const SizedBox(width: 5),
                            // SizedBox(
                            //   height: 50,
                            //   width: 50,
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       padding: const EdgeInsets.all(0),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       backgroundColor: AppColors.grey1,
                            //     ),
                            //     onPressed: () {
                            //       // Navigator.of(context, rootNavigator: true)
                            //       //     .push(
                            //       //   MaterialPageRoute(
                            //       //     builder: (context) => ProductDetailDialog(
                            //       //      model: widget.model,
                            //       //     ),
                            //       //   ),
                            //       // );
                            //     },
                            //     child: const Icon(
                            //       Icons.remove_red_eye_outlined,
                            //       color: AppColors.black,
                            //       size: 20,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8,
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
                            color:
                                isFavorite ? AppColors.pink : AppColors.black,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (discount != 0)
                    Positioned(
                      top: 8,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 1),
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
            ),
          ),
        );
      },
    );
  }
}
