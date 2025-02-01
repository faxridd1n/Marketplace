import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/hive/user_token.dart';
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
    return Card(
      elevation: 5,
      shadowColor: AppColors.black.withOpacity(0.5),
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
            width: MediaQuery.of(context).size.width * 0.55,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

                Text(
                  widget.model.name,
                  maxLines: 2,
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
                        context
                                .read<AuthenticationBloc>()
                                .state
                                .userAuthStatus ==
                            AuthStatus.authenticated)
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                  if (basketProductCount != 0) {
                                    basketProductCount -= 1;
                                    final variationId =
                                        widget.model.variations[0].id;
                                    context.read<BasketBloc>().add(
                                          PostBasketProductBasketEvent(
                                            productVariationId: variationId,
                                            count: basketProductCount,
                                          ),
                                        );
                                    context.showPopUp(
                                      context,
                                      title: translation(context).successful,
                                      message: widget.model.name,
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
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.grey1,
                                ),
                                onPressed: () {
                                  final variationId =
                                      widget.model.variations[0].id;
                                  basketProductCount += 1;
                                  context.read<BasketBloc>().add(
                                        PostBasketProductBasketEvent(
                                          productVariationId: variationId,
                                          count: basketProductCount,
                                        ),
                                      );

                                  context.showPopUp(
                                    context,
                                    title: translation(context).successful,
                                    message: widget.model.name,
                                  );

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
                              final token = userTokenBox.get('token')?.token;
                              if (token != null && token.isNotEmpty) {
                                final variationId =
                                    widget.model.variations[0].id;
                                basketProductCount = 1;
                                context.read<BasketBloc>().add(
                                      PostBasketProductBasketEvent(
                                        productVariationId: variationId,
                                        count: basketProductCount,
                                      ),
                                    );

                                context.showPopUp(
                                  context,
                                  title: translation(context).successful,
                                  message: widget.model.name,
                                );

                                setState(() {});
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
                )
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
                    isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                    color: isFavorite ? AppColors.pink : AppColors.black,
                    size: 25,
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
