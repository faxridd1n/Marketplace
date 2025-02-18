import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/price_function.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/core/utils/build_context_extension.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../user_auth_bloc/user_auth_bloc.dart';
import '../../../user_auth_bloc/user_auth_state.dart';
import '../../../widgets/login_dialog.dart';
import '../../basket/basket_bloc/basket_bloc.dart';

class FinProdWidget extends StatefulWidget {
  const FinProdWidget({
    required this.model,
    super.key,
  });
  final ProductDetailModel model;

  @override
  State<FinProdWidget> createState() => _FinProdWidgetState();
}

class _FinProdWidgetState extends State<FinProdWidget> {
  int selectedMonths = 0;
  // List oy = [3, 6, 9, 12];
  int basketProductCount = 0;
  int index = 0;
  int discount = 0;
  int priceIndex = 0;
  int saleIndex = 0;
  bool isAuthed = false;
  @override
  void initState() {
    isAuthed = context.read<AuthenticationBloc>().state.userAuthStatus ==
        AuthStatus.authenticated;
    // priceIndex = addSpaceEveryThreeCharacters(
    //     widget.model.result.variations[0].prices[0].value.toString());
    var result =
        context.read<BasketBloc>().state.basketResponseModel.result.products;
    for (var e in result) {
      if (e.productId == widget.model.result.id) {
        index = result.indexOf(e);
        basketProductCount = e.count;
      }
    }
    for (var price in widget.model.result.variations[0].prices) {
      if (price.type == 'Price' && price.value != 0) {
        priceIndex = widget.model.result.variations[0].prices.indexOf(price);

        for (var salePrice in widget.model.result.variations[0].prices) {
          if (salePrice.type == 'Sale' && salePrice.value != 0) {
            saleIndex =
                widget.model.result.variations[0].prices.indexOf(salePrice);
            discount = (100 - price.value * 100 / salePrice.value).toInt();
          }
        }
      }
    }
    super.initState();
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
            if (e.productId == widget.model.result.id) {
              index = result.indexOf(e);
              basketProductCount = e.count;
            }
          }
        } else {
          basketProductCount = 0;
        }
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    if (discount != 0)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${addSpaceEveryThreeCharacters(
                          widget.model.result.variations[0].prices[saleIndex]
                              .value
                              .toInt()
                              .toString(),
                        )} AED',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.grey2,
                          color: AppColors.grey2,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (discount != 0)
                          Container(
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
                        if (discount != 0) const SizedBox(width: 10),
                        Text(
                          '${addSpaceEveryThreeCharacters(
                            widget.model.result.variations[0].prices[priceIndex]
                                .value
                                .toInt()
                                .toString(),
                          )} AED',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                                      width: 80,
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
                                                .model.result.variations[0].id;
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
                                              message: widget.model.result.name,
                                            );
                                          } else if (basketProductCount > 1) {
                                            setState(() {
                                              basketProductCount -= 1;
                                            });
                                            final variationId = widget
                                                .model.result.variations[0].id;
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
                                              message: widget.model.result.name,
                                            );
                                          }
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: AppColors.black,
                                          size: 25,
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
                                      width: 80,
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

                                          final variationId = widget
                                              .model.result.variations[0].id;
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
                                            title:
                                                translation(context).successful,
                                            message: widget.model.result.name,
                                          );
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: AppColors.black,
                                          size: 25,
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: AppColors.green,
                                    ),
                                    onPressed: () {
                                      if (isAuthed) {
                                        final variationId = widget
                                            .model.result.variations[0].id;
                                        setState(() {
                                          basketProductCount = 1;
                                        });
                                        context.read<BasketBloc>().add(
                                              PostBasketProductBasketEvent(
                                                productVariationId: variationId,
                                                count: basketProductCount,
                                              ),
                                            );

                                        context.showPopUp(
                                          isSucces: true,
                                          context,
                                          title:
                                              translation(context).successful,
                                          message: widget.model.result.name,
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
                      ],
                    ),
                    const SizedBox(height: 10),
                    BlocConsumer<BasketBloc, BasketState>(
                      listenWhen: (previous, current) =>
                          previous.postResponseBasketStatusOnlyBuyNow !=
                          current.postResponseBasketStatusOnlyBuyNow,
                      listener: (context, state) {
                        if (state.postResponseBasketStatusOnlyBuyNow ==
                            FormzSubmissionStatus.success) {
                          context.showPopUp(
                            isSucces: true,
                            context,
                            title: translation(context).successful,
                            message: widget.model.result.name,
                          );
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => const BuyNowPage(),
                            ),
                          );
                        } else if (state.postResponseBasketStatusOnlyBuyNow ==
                            FormzSubmissionStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(translation(context).failed),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.grey1,
                          ),
                          onPressed: () {
                            if (context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .userAuthStatus ==
                                AuthStatus.authenticated) {
                              final variationId =
                                  widget.model.result.variations[0].id;
                              if (basketProductCount == 0) {
                                setState(() {
                                  basketProductCount += 1;
                                });
                              }

                              context.read<BasketBloc>().add(
                                    PostBasketProductBasketOnlyBuyNowEvent(
                                      productVariationId: variationId,
                                      count: basketProductCount,
                                    ),
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
                              translation(context).buyNow,
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
